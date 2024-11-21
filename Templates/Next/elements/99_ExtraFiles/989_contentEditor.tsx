/*
path: 989_contentEditor.tsx
keyPath: elements/99_ExtraFiles/989_contentEditor.tsx
unique_id: fh45AsTw
*/
import ContentTools from 'ContentTools'
import 'ContentTools/build/content-tools.min.css'
import React, { FunctionComponent } from 'react'
import _theme from './extendedcss.module.scss'
import "prismjs/themes/prism-coy.css"
import Prism from "prismjs"

ContentTools.Tools.CodeShow = (function(_super) {
  function CodeShow() {
    return CodeShow.__super__.constructor.apply(this, arguments)
  }

  ContentTools.ToolShelf.stow(CodeShow, 'CodeShow')
  ContentTools.DEFAULT_TOOLS[2][2] = 'CodeShow'
  CodeShow.label = 'CodeShow'

  CodeShow.icon = `${_theme.codeshow} codeshow`

  CodeShow.tagName = 'pre'

  CodeShow.canApply = function(element, selection) {
    if (!element || !element.content) {
      return false
    }
    return selection && !selection.isCollapsed()
  }

  CodeShow.isApplied = function(element, selection) {
    var from, to, _ref
    if (element.content === void 0 || !element.content.length()) {
      return false
    }
    _ref = selection.get(), from = _ref[0], to = _ref[1]
    if (from === to) {
      to += 1
    }
    return element.content.slice(from, to).hasTags(this.tagName, true)
  }

  CodeShow.apply = function(element, selection, callback) {
    var from, to, toolDetail, _ref
    toolDetail = {
      'tool': this,
      'element': element,
      'selection': selection
    }
    
    if (!ContentTools.Tool.dispatchEditorEvent('tool-apply', toolDetail)) {
      return
    }
    element.storeState()
    _ref = selection.get(), from = _ref[0], to = _ref[1]
    if (this.isApplied(element, selection)) {
      element.content = element.content.unformat(from, to, new HTMLString.Tag(this.tagName))
    } else {
      var tag = new HTMLString.Tag(this.tagName)
      tag.attr('class', 'language-javascript')
      element.content = element.content.format(from, to, tag)
    }
    element.content.optimize()
    element.updateInnerHTML()
    element.taint()
    element.restoreState()
    callback(true)
    return ContentTools.Tool.dispatchEditorEvent('tool-applied', toolDetail)
  }

  return CodeShow

})(ContentTools.Tool)

const ContEditor: FunctionComponent = (props: any) => {
  const [state, setstate] = React.useState({ content: '' })

  React.useEffect(() => {
    Prism.highlightAll()
  }, [])

  const ImageUploader = (dialog) => {
    let imagePath = 'image.png'
    let imageSize = [600, 174]
    let _dialog
    let _uploadingTimeout
    let _onCancel = () => {}
    let _onUnmount = () => {}
    let _onFileReady = (file) => {
      _dialog.progress(0)
      _dialog.state('uploading')

      var formData = new FormData()
      formData.append('image', file)

      fetcher(`{{ settings.apiURL }}/${props.uploadPath}`, {
        method: 'POST',
        headers: { 'Content-Type': 'multipart/form-data' },
        body: formData,
      }).then((res) => {
          imagePath = '/img/' + res.data.filename
          imageSize = [res.data.dimensions.width, res.data.dimensions.height]
          _dialog.progress(100)
        })

      const upload = () => {
        let progress = _dialog.progress()
        progress += 1
        if (progress <= 100) {
          _dialog.progress(progress)
          return (_uploadingTimeout = setTimeout(upload, 25))
        } else {
          return _dialog.populate(imagePath, imageSize)
        }
      }
      return (_uploadingTimeout = setTimeout(upload, 25))
    }
    let _onSave = () => {
      _dialog.busy(true)
      setTimeout(() => {
        _dialog.busy(false)
        _dialog.save(imagePath, imageSize)
      }, 1500)
    }

    function ImageUploader(dialog) {
      _dialog = dialog
      _dialog.addEventListener('cancel', _onCancel())
      _dialog.addEventListener('imageuploader.fileready', (ev) => {
        _onFileReady(ev.detail().file)
      })
      _dialog.addEventListener('imageuploader.save', _onSave)
    }
    return new ImageUploader(dialog)
  }

  let editor
  React.useEffect(() => {
    if (props.content) {
      if (props.content !== state.content) {
        const ct = ContentTools
        ct.IMAGE_UPLOADER = ImageUploader

        if (props.StylePalette) {
          ct.StylePalette.add(props.StylePalette.map((sp) => new ContentTools.Style(sp[0], sp[1], sp[2])))
        }
        editor = new ct.EditorApp.get()

        editor.init('*[data-editable]', 'data-name')
        editor.addEventListener('start', () => {})
        editor.addEventListener('saved', function (ev) {
          if (props.onSave) props.onSave(ev.detail().regions[0] || props.content)
        })
        setstate({ ...state, content: props.content })
      }
    }

    return () => {
      if (editor) editor.destroy()
    }
  }, [props.content])

  React.useEffect(() => {
    if (state.content) {
      Prism.highlightAll()
    }
  },[state])

  return React.createElement('div', {
    key: 'my-region',
    dangerouslySetInnerHTML: { __html: '<div data-editable="my-region">' + state.content + '</div>' },
  })
}

export default ContEditor

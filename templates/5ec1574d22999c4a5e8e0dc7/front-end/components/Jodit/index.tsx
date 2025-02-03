/*
path: index.tsx
type: file
unique_id: s392rWmh
icon: ico-field
*/
import React from "react";
import JoditEditor from "jodit-react";
import "jodit";

export default function JoditSetup(props) {
  let {
    darkMode = false,
    readOnly = false,
    initialValue = "",
    updateFiles,
    updateState,
    overrides,
  } = props;

  const config = React.useMemo(() => ({
    enableDragAndDropFileToEditor: true,
    readonly: readOnly,
    iframe: false,
    theme: darkMode ? "dark" : undefined,
    showPlaceholder: false,
    image: { openOnDblClick: false },
    toolbarButtonSize: "small",
    uploader: {
      insertImageAsBase64URI: true,
    },
    minWidth: "100%",
    tabIndex: 0,
    allowResizeY: false,
    beautify: false,
    beautifyHTMLCDNUrlsJS: [],
    sourceEditorCDNUrls: [],
    showCharsCounter: !readOnly,
    showWordsCounter: !readOnly,
    showXPathInStatusbar: !readOnly,
    controls: {
      attachFile: {
        exec: attachFiles,
        icon: "upload",
        tooltip: "Attach Files",
      },
    },
    events: {
      click: (event) => {
        if (event.target.tagName === "A") {
          window.open(event.target.href, "_blank");
          event.preventDefault();
        }
      },
      paste: onPaste,
      drop: onDrop
    },
    askBeforePasteHTML: false,
    askBeforePasteFromWord: false,
    processPasteHTML: true,
    processPasteFromWord: true,
    ...overrides,
  }), [darkMode, readOnly, overrides])

  function executeToggle(e) {
    e.toggleFullSize();
  }

  function onPaste(e) {
    let pastedItems = (e.clipboardData || e.originalEvent.clipboardData).items;
    for (let index in pastedItems) {
      if (pastedItems[index].kind === "file" && pastedItems.length < 4)
        new FileReader().readAsDataURL(pastedItems[index].getAsFile());
    }
  }

  function onDrop(e) {
    e.preventDefault();
    if (updateFiles) updateFiles(Array.from(e.dataTransfer.files));
  }

  function attachFiles() {
    let input = document.createElement("input");
    input.type = "file";
    let attribute = document.createAttribute("multiple");
    attribute.value = "multiple";
    input.setAttributeNode(attribute);
    input.onchange = ({ target }) => updateFiles(Object.keys(target.files).map((key) => target.files[key]));
    input.click();
  }

  return <JoditEditor config={config} value={initialValue} onBlur={updateState} />;
}

/*
path: DraggableTree.tsx
keyPath: elements/Experimental/DraggableTree/DraggableTree.tsx
unique_id: MA0y47Iq
*/
import React, { FunctionComponent, useState } from 'react'
import CustomNode from './CustomNode'
import classes from './draggabletree.module.scss'
const initialData = [
  {
    id: 1,
    parent: 0,
    droppable: true,
    text: 'Folder 1',
  },
  {
    id: 2,
    parent: 1,
    text: 'File 1-1',
  },
  {
    id: 3,
    parent: 1,
    text: 'File 1-2',
  },
  {
    id: 4,
    parent: 0,
    droppable: true,
    text: 'Folder 2',
  },
  {
    id: 5,
    parent: 4,
    droppable: true,
    text: 'Folder 2-1',
  },
  {
    id: 6,
    parent: 5,
    text: 'File 2-1-1',
  },
]

import { getBackendOptions, getDescendants, getParents, MultiBackend, NodeModel, Tree } from '@minoru/react-dnd-treeview'
import { DndProvider } from 'react-dnd'

export interface FormulaTreeProps {
  tree?: any
  theme?: any
  onSave?: Function
  onEdit?: Function
  onUpdate?: Function
  onDelete?: Function
  onChangeType?: Function
}

interface ExtendedNodeModel extends NodeModel {
  hidden?: boolean
}

const DraggableTree: FunctionComponent<any> = (props: FormulaTreeProps) => {
  const [treeData, setTreeData] = useState(props.tree || initialData)
  const finalClasses = props.theme ? props.theme : classes

  const Placeholder = (props) => {
    const left = props.depth * 24
    return <div className={finalClasses.placeholder} style={ { left }}></div>
  }

  const handleDrop = (newTreeData, event) => {
    const { dragSourceId, dropTargetId } = event

    const newData = newTreeData.map((node) => {
      if (node.id === dropTargetId) {
        return { ...node, changed: true }
      } else if (node.id === dragSourceId) {
        const subnode = { ...node }
        delete subnode.ref
        return {
          ...subnode,
          changed: true,
          parent: dropTargetId,
        }
      }

      return node
    })
    setTreeData(newData)
    if (props.onUpdate) props.onUpdate(newData)
  }

  React.useEffect(() => {
    try {
      if (JSON.stringify(props.tree) !== JSON.stringify(treeData)) setTreeData(props.tree)
    } catch (e) {
      setTreeData(props.tree)
    }
  }, [props.tree])

  const handleDelete = (node) => {
    if (node.nodeType === 'Formula') {
      const newTree = treeData.filter((treenode) => treenode.id !== node.id)
      newTree.filter((treenode) => treenode.id === node.parent)[0].changed = true
      props.onUpdate(newTree)
    } else {
      const deleteIds = [node.id, ...getDescendants(treeData, node.id).map((node) => node.id)]
      const newTree = treeData.filter((treenode) => !deleteIds.includes(treenode.id))
      props.onDelete(deleteIds)
      setTreeData(newTree)
    }
  }

  const handleCopy = (id) => {
    const newID = Date.now()
    const descendants = getDescendants(treeData, id)
    const copied = treeData.find((n) => n.id === id)

    const trans = [{ orig: id, new: newID }]
    const partialTree = descendants.map((node, index) => {
      if (!trans.find((t) => t.orig === node.id)) {
        trans.push({ orig: node.id, new: newID + index + 1 })
      }

      return {
        ...node,
        id: newID + index + 1,
        parent: trans.find((t) => t.orig === node.parent).new,
        data: {},
      }
    })

    setTreeData([
      ...treeData,
      {
        ...copied,
        id: newID,
        data: {},
      },
      ...partialTree,
    ])
  }

  const handleClick = (id) => {}

  const handleChangeVar = (id, newValue) => {
    const newData = treeData.map((node) => {
      if (node.id === id) {
        node.data.VariableName = newValue
      }
      return node
    })
    // setTreeData(newData)
    // props.onUpdate(newData)
  }

  const handleAdd = (id, e) => {
    const newData = [
      {
        id: Date.now(),
        data: {},
        parent: id,
        editable: true,
        droppable: true,
        nodeType: 'Value',
        changed: true,
        text: '...',
        permissions: 31,
      },
      ...treeData,
    ]
    props.onUpdate(newData)
    e.stopPropagation()
  }

  const handleEdit = (id, newValue) => {
    const oldData = [...treeData]
    const editedNode = oldData[treeData.findIndex((td) => td.id === id)]
    editedNode.text = newValue
    editedNode.changed = true
    setTreeData(oldData)
    props.onUpdate(oldData)
  }

  return (
    <>
      <DndProvider backend={MultiBackend} options={getBackendOptions()}>
        <Tree
          sort={false}
          insertDroppableFirst={false}
          dropTargetOffset={5}
          placeholderRender={(node, { depth }) => <Placeholder node={node} depth={depth} />}
          canDrop={(tree, { dragSource, dropTargetId, dropTarget }) => {
            if (dragSource?.parent === dropTargetId) {
              return true
            }
          }}
          tree={treeData}
          rootId={0}
          onDrop={handleDrop}
          classes={ {
            root: finalClasses.root,
            container: finalClasses.container,
            listItem: finalClasses.listItem,
            dropTarget: finalClasses.dropTarget,
            draggingSource: finalClasses.draggingSource,
            placeholder: finalClasses.placeholderContainer,
          }}
          canDrag={(node: any) => {
            if (node.draggable === false) return false
            return node.parent !== 0
          }}
          render={(node: ExtendedNodeModel, options) => {
            if (getParents(treeData, node.id).some((obj: ExtendedNodeModel) => obj.hidden) || node.hidden) return
            return (
              <CustomNode
                theme={finalClasses}
                node={node}
                onClick={handleClick}
                onDelete={handleDelete}
                onCopy={handleCopy}
                onAdd={handleAdd}
                onTextChange={handleEdit}
                onChangeType={props.onChangeType}
                handleChangeVar={handleChangeVar}
                {...options}
              />
            )
          }}
        />
      </DndProvider>
    </>
  )
}

export default DraggableTree

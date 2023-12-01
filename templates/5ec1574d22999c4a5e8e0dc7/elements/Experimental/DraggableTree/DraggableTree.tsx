/*
path: DraggableTree.tsx
completePath: >-
  /Users/gastongorosterrazu/Aptugo/BaseDev/templates/5ec1574d22999c4a5e8e0dc7/elements/Experimental/DraggableTree/DraggableTree.tsx
keyPath: elements/Experimental/DraggableTree/DraggableTree.tsx
unique_id: MA0y47Iq
*/
import React, { FunctionComponent, useState } from 'react'
import classes from './draggabletree.module.scss'
import CustomNode from './CustomNode'
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

import { getBackendOptions, MultiBackend, Tree, getDescendants } from '@minoru/react-dnd-treeview'
import { DndProvider } from 'react-dnd'

export interface FormulaTreeProps {
  tree?: any,
  onSave?: Function,
  onUpdate?: Function,
  onDelete?: Function,
  onChangeType?: Function
}


const getLastId = (treeData) => {
  const reversedArray = [...treeData].sort((a, b) => {
    if (a.id < b.id) {
      return 1
    } else if (a.id > b.id) {
      return -1
    }

    return 0
  })

  if (reversedArray.length > 0) {
    return reversedArray[0].id
  }
  return 0
}

export const Placeholder = (props) => {
  const left = props.depth * 24;
  return <div className={classes.placeholder} style={ { left }}></div>;
};




const DraggableTree: FunctionComponent<any> = (props: FormulaTreeProps) => {
  const [treeData, setTreeData] = useState(props.tree || initialData)

  const handleDrop = (newTreeData, props) => {
    const { dragSourceId, dropTargetId } = props
    const newData = newTreeData.map((node) => {
      if (node.id === dragSourceId) {
        const subnode = {...node}
        delete subnode.ref
        return {
          ...subnode,
          parent: dropTargetId
        };
      }

      return node;
    })
    setTreeData(newData)
    props.onUpdate(newData)
  };

  React.useEffect(() => {
    try {
      if (JSON.stringify(props.tree) !== JSON.stringify(treeData)) setTreeData(props.tree)
    } catch(e) {
      setTreeData(props.tree)
    }
    
  },[props.tree])

  const handleDelete = (id) => {
    const deleteIds = [
      id,
      ...getDescendants(treeData, id).map((node) => node.id)
    ]
    const newTree = treeData.filter((node) => !deleteIds.includes(node.id))
    props.onDelete(deleteIds)
    setTreeData(newTree)
  }

  const handleCopy = (id) => {
    const newID = Date.now()
    const descendants = getDescendants(treeData, id)
    const copied = treeData.find((n) => n.id === id)

    const trans = [{ orig: id, new: newID}]
    const partialTree = descendants.map((node,index) => {
      if (!trans.find(t => t.orig === node.id)) {
        trans.push({ orig: node.id, new: newID + index + 1 })
      }

      return ({
        ...node,
        id: newID + index + 1,
        parent: trans.find(t => t.orig === node.parent).new,
        data: {}
      })
    })

    setTreeData([
      ...treeData,
      {
        ...copied,
        id: newID,
        data: {}
      },
      ...partialTree
    ])
  }

  const handleClick = (id) => {
    console.log('handle click', id)

    // props.onClick(id)
  }

  const handleChangeVar = (id, newValue) => {
    const newData = treeData.map((node) => {
      if (node.id === id) {
        node.data.VariableName = newValue
      }
      return node;
    })
    console.log(newData)
    // setTreeData(newData)
    // props.onUpdate(newData)
  }

  const handleAdd = (id, e) => {
    const newData = [
      {
        id: Date.now(), 
        data: {},
        parent: id,
        droppable: true,
        nodeType: 'Value',
        text: '...'
      },
      ...treeData,
    ]
    props.onUpdate(newData)
    e.stopPropagation()
  }

  const handleEdit = (id, newValue) => {
    const oldData = [...treeData]
    oldData[treeData.findIndex(td => td.id === id)].text = newValue
    setTreeData(oldData)
  }

  return (
    <>
    <DndProvider backend={MultiBackend} options={getBackendOptions()}>
      <Tree
        sort={false}
        insertDroppableFirst={false}
        dropTargetOffset={5}
        placeholderRender={(node, { depth }) => (
          <Placeholder node={node} depth={depth} />
        )}
        canDrop={(tree, { dragSource, dropTargetId, dropTarget }) => {
          if (dragSource?.parent === dropTargetId) {
            return true;
          }
        }}
        tree={treeData}
        rootId={0}
        onDrop={handleDrop}
        classes={ {
          root: classes.root,
          container: classes.container,
          listItem: classes.listItem,
          dropTarget: classes.dropTarget,
          draggingSource: classes.draggingSource,
          placeholder: classes.placeholderContainer
        } }
        canDrag={(node:any) => {
          if (node.draggable === false) return false
          return node.parent !== 0
        }}
        render={(node, options) => <CustomNode
          node={node}
          onClick={handleClick}
          onDelete={handleDelete}
          onCopy={handleCopy}
          onAdd={handleAdd}
          onTextChange={handleEdit}
          onChangeType={props.onChangeType}
          handleChangeVar={handleChangeVar}
          {...options} 
        />}
      />
    </DndProvider>
    <button onClick={() => { props.onSave(treeData)}}>Guardar</button>
    </>
  )
}

export default DraggableTree
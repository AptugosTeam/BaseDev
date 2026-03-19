/*
path: index.js
keyPath: elements/Experimental/ClipPath/index.js
unique_id: mQKSfB4w
*/
import React from 'react';
import { getShape } from './schema';

const boxStyles = {
  width: '100px',
  height: '100px',
  margin: '0 auto',
  position: 'relative',
};

const shadowStyles = {
  backgroundColor: '#00c4ff',
  opacity: '0.25',
  position: 'absolute',
  top: '0px',
  left: '0px',
  right: '0px',
  bottom: '0px',
};

const componentStyles = {
  position: 'absolute',
  top: '0px',
  left: '0px',
  right: '0px',
  bottom: '0px',
};

const labelStyles = {
  textAlign: 'center',
  position: 'absolute',
  top: '46%',
  left: '40%',
  color: '#fff',
  fontSize: 'larger',
};

const Shape = (props) => {
  const backgroundColor = props.backgroundColor || '#12a8d6';
  const height = props.height;
  const width = props.width;
  const showShadow = props.showShadow;
  const shapeInfo = getShape(props.name);
  const formula = shapeInfo ? shapeInfo.formula : props.formula;
  const text = shapeInfo ? shapeInfo.name : props.text;
  const showLabel = props.showLabel;
  const id = props.id;
  const handleClick = props.handleClick;

  return (
    <div style={ { ...boxStyles, height, width }} onClick={handleClick}>
      {showShadow && <div style={ { ...shadowStyles, backgroundColor }}></div>}
      <div style={ { ...componentStyles, backgroundColor, clipPath: formula }} id={id}>
        {showLabel && <span style={labelStyles}>{text}</span>}
      </div>
    </div>
  );
};

export default Shape;

/*
path: ReactPDF.tsx
type: file
unique_id: sDF5CC0L
icon: ico-field
sourceType: typescript
children: []
*/

import React, { useState } from 'react';
import { Document, Page } from 'react-pdf';
import 'react-pdf/dist/Page/AnnotationLayer.css';

function ReactPDF(props) {
  const [numPages, setNumPages] = useState<number>(0);
  const [isActived, setisActived] = useState<Boolean>(props.showActionPage);

  function onDocumentLoadSuccess({ numPages }: { numPages: number }): void {
    setNumPages(numPages);
  }


  const maxPages = props.maxNumPages === false ? numPages : props.maxNumPages;

  const estilo1 = {
    position: 'relative' 
  }
  const estilo2 = {
    filter: 'blur(10px)'
  }
  const estilo3 = {
    position: 'absolute',
    top: '50%',
    left: '50%',
    transform: 'translate(-50%, -50%)',
    background: 'rgba(255, 255, 255, 0.8)',
    padding: '20px',
    borderRadius: '10px',
  }
  const estilo4 = {
    padding: '10px 20px',
    fontSize: '15px',
    fontWeight: 'bold',
    color: '#fff',
    backgroundColor: '#508acf',
    border: 'none',
    borderRadius: '5px',
    cursor: 'pointer',
    boxShadow: '0 2px 4px rgba(0, 0, 0, 0.2)',
    transition: 'background-color 0.3s ease',
  }

  return (
    <div>
      <Document file={props.file} onLoadSuccess={onDocumentLoadSuccess}>
        {Array.apply(null, Array(maxPages))
          .map((x, i) => i + 1)
          .map((page) => (
            <Page
              key={`page-${page}`}
              pageNumber={page}
              renderTextLayer={false}
              renderAnnotationLayer={false}
              width={props.pageWidth}
            />
          ))}
        {(props.maxNumPages !== false && numPages > props.maxNumPages && isActived)  && (
          <div style={estilo1}>
            <div style={estilo2}>
              <Page
                key={`page-${maxPages + 1}`}
                pageNumber={maxPages + 1}
                renderTextLayer={false}
                renderAnnotationLayer={false}
                width={props.pageWidth}
              />
            </div>
            <div
              style={estilo3}
            >
              <button onClick={() => props.action }
              style={estilo4}
              >
                {props.buttonText}
              </button>
            </div>
          </div>
        )}
      </Document>
    </div>
  );
}

export default ReactPDF;
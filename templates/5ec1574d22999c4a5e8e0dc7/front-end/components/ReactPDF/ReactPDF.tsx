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
import { Typography } from '@mui/material'

function ReactPDF(props) {
  const [numPages, setNumPages] = useState<number>(0);
  const [isActived, setisActived] = useState<Boolean>(props.showActionPage);

  function onDocumentLoadSuccess({ numPages }: { numPages: number }): void {
    setNumPages(numPages);
  }


  const maxPages = props.maxNumPages === false ? numPages : props.maxNumPages;

  const estilo1 = {
    position: 'relative',
  }
  const estilo2 = {
    filter: 'blur(0.5rem)',
  }
  const estilo3 = {
    position: 'absolute',
    top: '50%',
    left: '50%',
    transform: 'translate(-50%, -50%)',
    background: 'rgba(255, 255, 255, 0.8)',
    padding: '2rem 2rem 2.5rem',
    borderRadius: '10px',
    display: "flex",
    flexDirection: "column",
    alignItems: "center",
    justifyContent: "center",
    gap: "1.5rem",
    boxShadow: '0 2px 4px rgba(0, 0, 0, 0.2)',
  }
  const estilo4 = {
    marginTop: "1rem",
    width: "12rem",
    padding: '0.75rem 0rem',
    fontSize: '0.875rem',
    fontWeight: 'normal',
    color: "#f0f0f0",
    backgroundColor: '#46737a',
    border: 'none',
    borderRadius: '0.5rem',
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

              <div style={estilo3}>
                <img src="https://mtl-media.s3.us-east-1.amazonaws.com/noEvaluations.svg" alt="/img/noEvaluations.svg" />

                <Typography variant="body1">Debes <b>comenzar la evaluación</b> para acceder al manual</Typography>

                <button onClickCapture={props.action} style={estilo4}>
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
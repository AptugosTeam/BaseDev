/*
path: ReactPDF.tsx
type: file
unique_id: sDF5CC0L
icon: ico-field
sourceType: typescript
children: []
*/

import React from 'react'
import { useState } from 'react';
import { Document, Page } from 'react-pdf';
import 'react-pdf/dist/Page/AnnotationLayer.css';

function ReactPDF(props) {
  const [numPages, setNumPages] = useState<number>();
  const [pageNumber, setPageNumber] = useState<number>(1);

  function onDocumentLoadSuccess({ numPages }: { numPages: number }): void {
    props.maxNumPages ? setNumPages(props.maxNumPages) : setNumPages(numPages)
  }

  return (
    <div>
      <Document file={props.file} onLoadSuccess={onDocumentLoadSuccess}>
        {
            Array.apply(null, Array(numPages))
            .map((x, i) => i + 1)
            .map((page) => {
                return (
                    <Page
                    pageNumber={page}
                    renderTextLayer={false}
                    renderAnotationLayer={false}
                    width={props.pageWidth}
                    />
                )
            })
        }
      </Document>
      
    </div>
  );
}
export default ReactPDF;
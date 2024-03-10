/*
path: InfiniteLooper.tsx
type: file
unique_id: sMlINF1O
icon: ico-field
sourceType: typescript
children: []
*/

import React, { useState, useEffect, useRef, useCallback, FC, ReactNode } from "react";
import classes from './InfiniteLooper.module.scss'

interface InfiniteLooperProps {
  speed: number;
  direction: "right" | "left";
  children: React.ReactNode;
}

const InfiniteLooper:
FC<InfiniteLooperProps> = (props) => {
  const [looperInstances, setLooperInstances] = useState(1);
  const outerRef = useRef<HTMLDivElement>(null);
  const innerRef = useRef<HTMLDivElement>(null);

  const resetAnimation = () => {
    if (innerRef?.current) {
      innerRef.current.setAttribute("data-animate", "false");

      setTimeout(() => {
        if (innerRef?.current) {
          innerRef.current.setAttribute("data-animate", "true");
        }
      }, 10);
    }
  }

  const setupInstances = useCallback(() => {
    if (!innerRef?.current || !outerRef?.current) return;

    const { width } = innerRef.current.getBoundingClientRect();

    const { width: parentWidth } = outerRef.current.getBoundingClientRect();

    const widthDeficit = parentWidth - width;

    const instanceWidth = width / innerRef.current.children.length;

    if (widthDeficit) {
      setLooperInstances(
        looperInstances + Math.ceil(widthDeficit / instanceWidth) + 1
      );
    }

    resetAnimation();
  }, [looperInstances]);
  
  
  /*
    6 instances, 200 each = 1200
    parent = 1700
  */

  useEffect(() => setupInstances(), [setupInstances]);

  useEffect(() => {
    window.addEventListener("resize", setupInstances);

    return () => {
      window.removeEventListener("resize", setupInstances);
    };
  }, [looperInstances, setupInstances]);

  return (
      <div className={classes.looper} ref={outerRef}>
        <div className={classes.looper__innerList} ref={innerRef} data-animate="true">
          {[...Array(looperInstances)].map((_, ind) => (
            <div
              key={ind}
              className={classes.looper__listInstance}
              style={{
                animationDuration: `${props.speed}s`,
                animationDirection: props.direction === "right" ? "reverse" : "normal",
              }}
            >
              {props.children}
            </div>
          ))}
        </div>
      </div>
  );
}

export default InfiniteLooper


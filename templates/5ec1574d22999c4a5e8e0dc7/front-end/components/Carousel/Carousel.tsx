/*
path: Carousel.tsx
type: file
unique_id: sBI3GK1O
icon: ico-field
sourceType: typescript
children: []
*/

import Slide from '@mui/material/Slide'
import { styled } from '@mui/material/styles'
import ArrowBackIcon from '@mui/icons-material/ArrowBack'
import ArrowForwardIcon from '@mui/icons-material/ArrowForward'
import React, { FunctionComponent } from 'react'

const classes = {
  root: 'carousel-root',
  backArrow: 'carousel-backArrow',
  forwardArrow: 'carousel-forwardArrow',
  carouselDots: 'carousel-root',
  carouselDot: 'carousel-carouselDot',
  currentCarouselDot: 'carousel-currentCarouselDot',
}

const Root = styled('div')(({ theme}) => ({
  [`&.${classes.root}`]: {
    display: 'flex',
    position: 'relative',
    alignItems: 'center',
    '&:hover': {
      '& $backArrow': {
        opacity: 1,
      },
      '& $forwardArrow': {
        opacity: 1,
      },
    },
  },
  [`&.${classes.backArrow}`]: {
    position: 'absolute',
    zIndex: 10,
    fontSize: '48px',
    color: 'white',
    left: '10%',
    top: 'calc(50% - 24px)',
    opacity: 0,
    transition: 'opacity 300ms linear',
  },
  [`&.${classes.forwardArrow}`]: {
    position: 'absolute',
    zIndex: 10,
    fontSize: '48px',
    color: 'white',
    right: '10%',
    top: 'calc(50% - 24px)',
    opacity: 0,
    transition: 'opacity 300ms linear',
  },
  [`&.${classes.carouselDots}`]: {
    position: 'absolute',
    bottom: 0,
    left: '50%',
    display: 'flex',
  },
  [`&.${classes.carouselDot}`]: {
    width: '10px',
    height: '10px',
    margin: '4px',
    backgroundColor: '#000',
    borderRadius: '5px',
    opacity: '0.5',
    '&:hover': {
      opacity: '1',
    },
  },
  [`&.${classes.currentCarouselDot}`]: {
    opacity: '1',
  }
}))

interface carouselProps {
  autoPlay: boolean
  height: string
  arrowsOrDotsMethod: 'none' | 'arrows' | 'dots'
  showSlide?:number 
}

const AptugoCarousel: FunctionComponent<carouselProps> = (props) => {
  const [currentSlide, setCurrentSlide] = React.useState<number>(props.showSlide || 0)
  const [isOver, setIsOver] = React.useState<boolean>(false)
  let timer

  const slides = props.children as Array<React.ReactElement>

  const nextSlide = () => {
    const nextSlide = currentSlide + 1 === slides.length ? 0 : currentSlide + 1
    setCurrentSlide(nextSlide)
  }

  const mouseOverHandler = () => {
    clearTimeout(timer)
    setIsOver(true)
  }

  const mouseLeaveHandler = () => {
    if (props.autoPlay) {
      timer = setTimeout(() => {
        nextSlide()
      }, 10000)
    }
    setIsOver(false)
  }

  React.useEffect(() => {
    if (props.autoPlay && !isOver) {
      timer = setTimeout(() => {
        nextSlide()
      }, 10000)
    }
  }, [currentSlide, timer])

    React.useEffect(() => {
     setCurrentSlide(props.showSlide)
  }, [props.showSlide])

  return (
    <div className={classes.root} style={ { height: props.height } }>
      {props.arrowsOrDotsMethod === 'arrows' && <ArrowBackIcon className={classes.backArrow} />}
      <div style={ { height: props.height } }>
        {slides.map((child, index) => {
          return (
            <Slide
              key={index}
              style={ { position: 'absolute' } }
              direction={currentSlide === index ? 'left' : 'right'}
              in={currentSlide === index}
              timeout={300}
            >
              <div style={ { width: '100%' } } onMouseOver={mouseOverHandler} onMouseLeave={mouseLeaveHandler}>
                {child}
              </div>
            </Slide>
          )
        })}
      </div>
      {props.arrowsOrDotsMethod === 'dots' && (
        <div className={`${classes.carouselDots} carouselDots`}>
          {slides.map((child, index) => {
            return (
              <div
                key={`dot_${index}`}
                className={`${classes.carouselDot} ${currentSlide === index && classes.currentCarouselDot}`}
                onClick={() => setCurrentSlide(index)}
              />
            )
          })}
        </div>
      )}
      {props.arrowsOrDotsMethod === 'arrows' && <ArrowForwardIcon onClick={() => nextSlide()} className={classes.forwardArrow} />}
    </div>
  )
}

export default AptugoCarousel

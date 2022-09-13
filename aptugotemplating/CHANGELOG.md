# Change Log

All notable changes to the "aptugotemplating" extension will be documented in this file.

Check [Keep a Changelog](http://keepachangelog.com/) for recommendations on how to structure this file.

## [Unreleased] [TEMPLATES 1.4.13]

### Added

### Changed

### Fixed

## [TEMPLATES 1.4.12] - 2022-09-06

### Added

- **Merge Deep:**
  Advanced element that provides a function named mergeDeep() which, when called, can receive as arguments any amount of javascript objects and returns an object with all the objects joined.

- **View Pdf:**
  Provides an iframe to render generated PDF documents.

### Changed

- Unique icons for elements.

- Import CSV Structure update.

- User Authentication Structure styles update.

## [TEMPLATES 1.4.11] - 2022-09-01

### Added

- **Slider:**
  Allow users to make selections from a range of values. Reflects a range of values along a bar, from which users may select a single value. They are ideal for adjusting settings such as volume, brightness, or applying image filters.

- **Product Card (Layouts):**
  A special type of Card designed exclusively for products. The element contains other elements that complement its functionality. Inside these elements you can place texts, images and various buttons. Comes with 4 new elements that can be used as childs (Actions, Content, Header and Media).

- **Composed Chart:**
  Allows you to create a graphical representation. It can be used to view balances or make comparisons of any kind. Comes with 3 new elements that can be used as childs (Area, Line, Bar).

- **Parallax:**
  Parallax allows a visual effect that simulates the displacement of images or textures that are in the background. The result is an illusion of depth, creating an effect similar to a 3d landscape.

- **React Carousel:**
  Creates a sliding effect that allows to display different elements in the form of slides. With this effect we can easily display images and texts without scrolling the page.

### Changed

- **Function:**

  - _Async:_ On 'Advanced Properties' is now possible to build an asynchronous function.

- **Card Actions:**

  - _Disable Spacing:_ If the option is enabled, elements placed inside Card Actions have no extra margin.

- **Card Media:**

  - _Images:_ It is possible to add an image by path or by choosing an asset
  - _Width:_ now is possible to add a width in px.
  - _Height:_ now is possible to add a height in px.

- **User Authentication (Structure):**

  - Now it is not necessary to set any values when selecting the structure.
  - Default route after successful login is the main page '/'
    Google, Facebook and Twitter login and register disabled.
  - The default role when register was set as 'User'

- **Leaflet:**

  - _Position:_ It is possible to set the center position of the map using `[lat,lng]` format.
  - _Zoom:_ It is possible to change the default zoom of the map.
  - _Zoom with Mouse Wheel:_ On 'Advanced Properties' it is now possible to decide if the user can zoom in/out with the mouse scroll wheel.

- **Div:**
  - _Tag:_ Now it is possible to change the tagname used by the div element.

### Fixed

- **Define Variable:**

  - The display name was changed to 'Variable Name' for a better comprehension.

- **Card:**

  - Minimal fixes to max width and height.

- **Email:**

  - Solved error where 'sendEmail' function appeared outside functional component.

- **Marker:**

  - Syntax was changed to `[lat,lng]` and takes leafLetPosition by default value if no value is setted.

- **Simple Link:**

  - Modified to use 'class' instead of 'className'.

- Initial release

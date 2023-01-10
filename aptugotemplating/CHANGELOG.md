# Change Log

All notable changes to the "aptugotemplating" extension will be documented in this file.

Check [Keep a Changelog](http://keepachangelog.com/) for recommendations on how to structure this file.

## [TEMPLATES 1.5.2] -

### Added

- **Swiper:**
  It is a special type of carousel. It allows you to display different types of items in an infinite loop where each item scrolls horizontally, similar to a set of slides.

## [TEMPLATES 1.5.1] - 2023-01-03

### Changed

- Index.js solving strictQuery DeprecationWarning from Mongoose.

- Dependencies for React and React Native Updated

- **Data Table:**

  - Reverting dataTable mistaken update.

- **Pdf Document:**

  - Auto install the react-pdf library when using the element.

- **Radar:**

  - It is possible to set the Grid Label Offset.
  - It is possible to set the Grid Shape.

- **Email**

  - User, Password, Email Params and From fields are required.
  - Adding default values.

- **Material Icon:**

  - Now it is possible to change the Size of the icon.
  - ClassName properly working.
  - Icon field required.
  - Now it is possible to add a custom color.

- **Icon Button:**

  - New icons added.
  - Icons in alphabet order.
  - Action display renamed to On Click.
  - Now it is possible to add a Custom Color.
  - It is possible to change the size of the icons and the unit to do it.
  - It is possible to add Extra Styles.

### Removed

- **Link:** [Deprecated]

## [TEMPLATES 1.5.0] - 2022-11-07

### Added

- **Rating:**

### Changed

- Add strictPopulate false for 2nd level relationships.

- Updates to Code Snippets.

- Update import csv structure for Aptugo 1.7

- **Popup Dialog:**

  - Supports ClassName.

- **Checkbox:**

  - Checked variable is optional.

- **Table:**

  - Now it is possible to add a default page.

- **Load from Database:**

  - Now it is possible to add a default page.

## [TEMPLATES 1.4.16] - 2022-10-06

### Added

- **Code Snippets:** [Experimental]

  New experimental coding functionality with a function editor and code snippets giving a new interactive experience.

- **Animations (Category):**

  - New category added including 8 brand new animation elements:

    - _Attention Seeker_:
      Gives the associated item a variety of effects.

    - _Bounce_:
      Allows the element associated with it to appear from the left of the screen to the default location, quickly and stopping when it arrives, like a race car.

    - _Fade_:
      It allows the element associated with it to appear scrolling from the four main directions (left, right, up and down).

    - _Flip_:
      Allows the element associated with it to traverse a circumferential path on the x-axis (horizontally).

    - _Hinge_:
      It allows the element associated with it to incorporate a falling effect, similar to what occurs when an object (such as a painting) detaches from the surface that supports it.

    - _Jack In The Box_:
      Displays the element associated with it with a movement from the back to the front, in an oblique direction, ending with the legendary movement of the Jack in the box toy or surprise box.

    - _Rotate_:
      Allows the associated element a transformation in which the element rotates around itself at a fixed point.

    - _Zoom_:
      Its effect on elements is to enlarge them from a similar dimension to their original size.

### Changed

- **Accordion:**

  - Elevation removed.
  - It can be disabled.
  - Now it is possible to style Width, Height, Padding, Color and Background Color.
  - Accordion Details, Accordion Summary as default childs.

- **Accordion Details:**

  - Now it is possible to style Background Color and Color.

- **Accordion Summary:**

  - Now it is possible to style Background Color and Color.

- **Box:**

  - Now it is possible to change the html tagname used by the element.
  - It is possible to add extra styles.
  - Color, and devices displays removed.

- **Container:**

  - Disable Gutters and Fixed as advance properties.
  - It is possible to add extra styles.

- **Autocomplete (Field):**

  - Now checks for duplicates.

### Removed

- **Button with Icon:** [Deprecated]

## [TEMPLATES 1.4.15] - 2022-09-17

### Fixed

- **File Upload**:

  - Remove makeStyles as default styling.

## [TEMPLATES 1.4.14] - 2022-09-15

### Changed

- Variable tables are not sortable.

### Fixed

- **Text**:

  - Backwards compability for text element.

### Removed

- MUI/Styles
- React-Hot-Loader

## [TEMPLATES 1.4.13] - 2022-09-14

### Added

- **Pdf Link:**
  Allows you to display a hyperlink within the PDF document. It can be nested as a parent of either a Text element or an image.

- **Pdf Stylesheet:**
  Allows adding styles to any element of the PDF family. Defines a variable that receives a javascript object with the selectors and properties that you want to add to each element.

- **Pdf Renderer:**
  Provides an iframe to render generated PDF documents.

- **Radial Bar Chart:**
  Bar Chart plotted on a polar coordinate system, rather than on a Cartesian one.

### Changed

- Update Packages Requirements

- **Composed Chart:**

  - Now it is responsive
  - It is possible to hide Axis, Cartesian Grids and Leyends

- **User Authentication (Structure):**

  - Default styles modified on Login, Register and Forgot Pages.

- **Text:**

  - Complete path added.
  - Code updated.

- **Pdf Document:**

  - Document _Creator_, _Producer_, _PDF Version_, _Language_ and _OnRender function_ as advance properties.
  - New icon.

- **Pdf Download:**

  - Now it is possible to style the download button.
  - New icon.
  - Default child _Document_ removed.

- **Pdf Image:**

  - _Cache_ and _Debug_ as advanced properties.
  - Now it can receive inline styles or receive a variable.

- **Pdf Page:**

  - Default page size is 'A4'.
  - _Debug_ as advanced properties.
  - Now it can receive inline styles or receive a variable.

- **Pdf Text:**

  - _Dynamic Render Function_, _Hyphenation Callback_ and _Debug_ as advanced properties.
  - Now it can receive inline styles or receive a variable.
  - _Text_ Element as a default child.

- **Pdf View:**

  - _Dynamic Render Function_ and _Debug_ as advanced properties.
  - Now it can receive inline styles or receive a variable.

- **Div:**

  - _Use Reference_, _On Click_ and _Different HTML Tag_ as advanced properties.

- **New Application (Structure):**

  - Setted default _Database Connect String_, _Api Url_ and _URL_ settings as the application name for better user experience.

- **Autolinking:**

  - _From Link_ property is setted as 'required'.

### Fixed

- **Div**:

  - Fixed bug when the _unique_id_ option was selected and at the same time an _ID_ was placed in the field (both were saved in code), causing an error.

### Removed

- **View Pdf** ( Replaced by Pdf Renderer )

## [TEMPLATES 1.4.12] - 2022-09-06

### Added

- **Merge Deep:**
  Advanced element that provides a function named _mergeDeep()_ which, when called, can receive as arguments any amount of javascript objects and returns an object with all the objects joined.

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

  - The display name was changed to _Variable Name_ for a better comprehension.

- **Card:**

  - Minimal fixes to max width and height.

- **Email:**

  - Solved error where _sendEmail_ function appeared outside functional component.

- **Marker:**

  - Syntax was changed to `[lat,lng]` and takes _leafLetPosition_ by default value if no value is setted.

- **Simple Link:**

  - Modified to use 'class' instead of 'className'.

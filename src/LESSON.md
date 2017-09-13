for: slides

### *Today's Lesson*
# CSS: Floats and Positioning

???
Start quick-time

- handle agenda time for readme (maybe break out into its own special markup)
- add shay howe to resrouces
- add http://mattryall.net/image/css-normal-flow.png or similar diagram to intro


---

for: alexa readme

Being able to create complex and robust layouts via CSS is crucial to creating modern user interfaces on the web. Today we'll learn how to use the float and position properties (along with many other supporting properties) to control where elements are rendered on the page.

---

for: alexa readme slides
name: agenda

# Agenda

#### Overview & Intro .agenda-time[(5 min)]

--

#### Floats  .agenda-time[(40 min)]

- `float: left` & `right`
- Wrapping Content
- Clearing Floats
- Containing Floats with `overflow`
- Use Cases

--

#### Positioning .agenda-time[(30 min)]

- `static`
- `relative`
- `absolute`
- `fixed`
- `z-index`

--

#### In Class Exercise: Galaxy Restaurant Menu  .agenda-time[(30 min)]

--

#### Recap and Further Resources  .agenda-time[(5 min)]

---

for: slides

# Overview

How do floats and positioning fit into the big picture?

--

Any questions on the course content so far?

---

for: alexa readme slides

# Intro

An HTML document will, by default, display content from left-to-right, top-to-bottom.

--

We can override this flow by using **floats** and **positioning**.

---

for: alexa readme slides

layout: true

# Floats

---

for: readme slides

## Lesson Working File
[Floats Lesson Working File](../floats/lesson/index.html)

---

for: slides

layout: true

.right-heading[Floats]

---

for: alexa readme slides

## Left & Right

By default, elements are not floated, aka `float: none`

--

We can float an element by applying `float: left` or `float: right`.

--

Floated elements are pulled to the inner left or right edge of their containing element, or to the outer edge of a previously floated element.

--

Floated block level elements, which by default normally have a width set 100% of their containing element, will now only have enough width to hold its content.

--

When we use float, we usually set the width of the floated element.

---

for: alexa readme slides

## Wrapping Content

If content follows a floated element, and it hasn't been cleared, it will wrap around the floated element.

---

for: alexa readme slides

## Clearing Floats

Use the `clear: both` property on an element to take it out of the previously floated context and restore it back to the regular flow of the document.

---

for: alexa readme slides

## Containing Floats With Overflow

By default, a floated parent element is not aware of its child floated elements, and will set its height accordingly (i.e. ignore the height of its child elements).

--

To make a parent element aware of its floated child, we need to set its `overflow` property to `auto`, `hidden`, or `scroll`.

---

for: readme slides

## Example Use Cases

- [Two Column Layout](../floats/example-use-cases/two-column-layout/index.html)
- [Three Column Layout](../floats/example-use-cases/three-column-layout/index.html)
- [Wrap Around An Image](../floats/example-use-cases/wrap-around-img/index.html)
- [Grid With Unknown Number of Entities](../floats/example-use-cases/grid-with-unknown-number-of-entities/index.html)
- [Large Uppercase First Letter of a Paragraph](../floats/example-use-cases/large-uppercase-first-letter-of-a-paragraph/index.html)

---

for: alexa readme slides

layout: true

# Positioning

---

for: readme slides

## Lesson Working Files

[Positioning Lesson Working File](../positioning/index.html)

---

for: alexa readme slides

layout: true

.right-heading[Positioning]

---

for: alexa readme slides

## `position: static;`

- by default, all elements are positioned as static

--

- the `top`, `bottom`, `right`, and `left` properties have no effect on statically positioned elements

--

- we usually don't explicitly position something as static, as it's the default

---

for: alexa readme slides

## `position: relative;`
- creates a positioning context around the element

--

- you can see this context using the chrome dev tools

--

- instructs the element to obey the `top`, `bottom`, `right`, and `left` properties

--

- the `top`, `bottom`, `right`, and `left` properties accept the various CSS units: `px`, `em`, `%`

--

- the `top`, `bottom`, `right`, and `left` properties accept negative numbers

--

- usually we don't specify the `top`, `bottom`, `right`, and `left` for `position: relative`, but rather we use `position: relative` when we want to create a context for inner `absolute` elements to be positioned

---

for: alexa readme slides

## `position: absolute;`

- takes the element out of the regular html flow, and positions according to the nearest parent contained that is positioned as `relative`, `absolute` or `fixed`

--

- instructs the element to obey the `top`, `bottom`, `right`, and `left` properties

---

for: alexa readme slides

## `position: fixed;`

- like `position: absolute` but context is never parent element but rather is always the browser window

--

- fixed position elements on the page will remain as other elements scroll by

---

for: alexa readme slides

## `z-index`

- controls z-axis (front to back)

--

- used for stacking elements on top of other elements

--

- natural `z-index` is order of elements in document

--

- the higher the `z-index`, the closer to the top of the stack it is

--

- default `z-index` for elements is `0`

--

- elements with `z-index` set are contained within parent elements that have `z-index` set

--

- elements must be positioned with `relative`, `absolute` or `fixed` or else a `z-index` property will be ignored

--

- `z-index` accepts negative numbers, although those can be difficult to work with

---

for: readme slides

layout: false

# Galaxy Restaurant Menu

### In Class Exercise

[Galaxy Restaurant Menu](../menu-exercise/galaxy-restaurant-menu.pdf)


---

for: readme slides

# Recap and Further Resources

## Float Resources

- [MDN: float](https://developer.mozilla.org/en-US/docs/Web/CSS/float) (documentation)
- [MDN: Floats - learn web development](https://developer.mozilla.org/en-US/docs/Learn/CSS/CSS_layout/Floats) (tutorial)

## Positioning Resources

- [MDN: position](https://developer.mozilla.org/en/docs/Web/CSS/position) (documentation)
- [Learn CSS Layout: Position](http://learnlayout.com/position.html) (tutorial)
- [CSS Positioning 101](http://alistapart.com/article/css-positioning-101) (tutorial)

## Bonus Resource

- [Shae Howe Positioning Content](http://learn.shayhowe.com/html-css/positioning-content/) (tutorial)

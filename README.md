# ContainerMultipleView

A quick example on how to use Container View and custom Segues to circumvent its natural limitation of containing a single View as the embedded component. It largely follows [@mluton](https://github.com/mluton)'s implementation whose code can be seen [here](https://github.com/mluton/EmbeddedSwapping), with a more detailed explanation [in his website](http://sandmoose.com/post/35714028270/storyboards-with-custom-container-view-controllers). 

## How does it work?

It subclasses `UIViewController` to provide a class that does most of the heavy lifting through custom Segue that does nothing. This custom Segue is also a subclass to `UIStoryboardSegue`. The super view, which contains the container, fires up the segues in the embedded one, responsible for managing adding and removing subviews to include the appropriate one.

In this example, 3 Views are used, distinguished by their background colors.

## HOWTO

The storyboard looks like this:

![Storyboard for Multiple Views in Container View](storyboard.png?raw=true "Storyboard for Multiple Views in Container View")

Notice there's a single View Controller embedded by the container view. It also has multiple segues to the sub views. This View Controller must be a `ContainerMultipleViewController` and the Segues must be `EmptySegue`.

Each Segue must have a unique identifier, which must be put inside `ContainerMultipleViewController` so it can keep track of them. 

In order to switch, I have opted by three buttons but this is not required. Any kind of control or action could be used here. However, it is important that the View Controller that holds the Container View has a reference to the `ContainerMultipleViewController` object inside it, making it possible to fire the segues. This is achieved by overriding `prepareForSegue` since the embed segue runs when the view is loaded. Check `ViewController` for it.

## Acknowledgments

* [@mluton](https://github.com/mluton) for his fantastic post which inspired me to write this

## License

MIT

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.

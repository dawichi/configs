# Testing

### Theory

Testing is a 3 step process

```
Arrange => Act => Assert
```

1 **Arrange:** simulate the initial state of the app
2 **Act:** something happens and modify the state
3 **Assert:** confirm that our hypothesis about what should be the state is correct or not


### Potential drawbacks

* Writing tests is time consuming and difficult.
* In certain scenarios executing tests in CI can cost actual money.
* If done incorrectly, it can give you false positives. Your tests pass, but your app doesn’t function as intended.
* Or false negatives. Your tests fail but your app is functioning as intended.


### Philosophy keys

* Many integration tests
* NO snapshot tests
* Few unit tests
* Few e to e tests


### Shallow vs Mount

Mount actually executes the html, css and js code like a browser would, but does so in a simulated way. It is “headless” for example, meaning it doesn’t render or paint anything to a UI, but acts as a simulated web browser and executes the code in the background.

Not spending time painting anything to the UI makes your tests much faster. However mount tests are still much slower than shallow tests.

This is why you unmount or cleanup  the component after each test, because it’s almost a live app and one test will affect another test.

Mount/render is typically used for integration testing and shallow is used for unit testing.

shallow rendering only renders the single component we are testing. It does not render child components. This allows us to test our component in isolation.

So:

* Mount: renders the component and every child component
* Shallow: only renders a unique component (usually better)


### unit - integration - end to end

* **Unit testing:** tests an isolated part of your app (usually done with shallow rendering). Example: a component renders with default props

* **Integration testing:** tests if different parts work and integrate with each other correctly. Example: test if a component can update context in a parent

* **End to end testing:** Usually combines multiple unit and integration tests into one big test. Tests are done in a simulated browser. Example: testing an entire authentication flow


# strategy_design_pattern_gof

A behavioural design pattern that promotes open-close principle of SOLID

## Strategy design pattern

Define a family of algorithms, encapsulate each one, and make them
interchangeable. Strategy lets the algorithm vary independently
from clients that use it.

The main idea of this pattern is to extract related algorithms(or any piece of code) into separate classes and define a common interface for them. This enable compile-time flexibility which means new algorithms can be added by defining new classes and existing ones can be changed independently.

Another advantage of this pattern is that allows you to isolate the code, internal data and dependencies of various algorithms from the rest of the code

This pattern promotes the **Open-Closed Principle** (the letter O in SOLID principles) since extending your code with new behaviour (algorithm) does not insist you change the logic inside a single class but allows creating a new strategy class instead. As principle states:
> software entities(class, modules, functions, etc.) should be open for extension, but closed for modification.

# Problem
Let's say that your e-shop business offers several different shipping types for your customers:

 * Picking up the ordered items from a physical store (or any other physical place, e.g. a warehouse);
 * Sending order items using parcel terminal services;
 * Sending order items directly to your customers in the shortest delivery time possible - priority shipping.

These three types contain different shipping costs calculation logic which should be determined at run-time, e.g. when the customer selects a specific shipping option in UI.

![strategy design pattern example](https://raw.githubusercontent.com/m8811163008/strategy_design_pattern/master/assets/screenshots/1.png)


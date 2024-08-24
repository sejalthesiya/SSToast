SSToast
=======

A lightweight, customizable toast notification manager for iOS apps.

Overview
--------

SSToast is a simple, easy-to-use library for displaying toast notifications in your iOS app. It provides a flexible way to customize the appearance and behavior of your toasts, making it easy to integrate with your app's UI.

Features
--------

* **Customizable appearance**: Easily customize the background color, text color, and icon of your toasts using the `Toast` struct and `ToastStyle` enum.
* **Flexible duration**: Set the duration of your toasts using the `duration` property of the `Toast` struct.
* **Queueing**: SSToast uses a queue to manage multiple toasts, ensuring that only one toast is displayed at a time.
* **Easy integration**: Simply create an `SSToastManager` instance and call the `show(toast:)` method to display a toast.

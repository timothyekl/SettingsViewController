# SettingsViewController

Tim Ekl, 2011

This project is meant to provide a simple drop-in solution for providing
a custom "settings" screen in iOS applications. It replicates and extends
the appearance and functionality of the iPhone Settings application by
implementing:

* A grouped table view containing settings
* Section headers
* Text-field and list-picker setting entry
* "Enabled" and "disabled" settings

This project is still young and is deliberately meant to be simple, and so
is notably missing several features supported by the Apple Settings app or
other in-app settings implementations. Contributions are welcome.

## Adding a SettingsViewController to your app

Placing a SettingsViewController in your application is as simple as one
class and one method. After cloning the SettingsViewController project and
adding its files to Xcode, all you need to do is:

1. Create a custom subclass of SettingsViewController. This subclass will
   handle one screen's worth of settings.
2. Implement the method `-buildSettings` to populate the `self.settings`
   property in your custom subclass. The `settings` property is an instance
   of MutableOrderedDictionary (also included in this project); elements
   in this dictionary should be NSArrays of Setting objects. Once built:
   
   * The keys of the dictionary will be used as section titles
   * The values (NSArrays) in the dictionary will be used as section
     contents
   * Each Setting object will create a single table view cell
   
   See the demo (on the `demo` branch) for more details.
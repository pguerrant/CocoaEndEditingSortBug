CocoaEndEditingSortBug
======================

Demonstrates a bug in Cocoa where sorting a column in an NSTableView prevents controlTextDidEndEditing from being called

To reproduce the issue(s)

1. Edit any of the columns - you should see 2 messages in the output:
    - should end editing
    - did end editing
   These output from the controlTextDidEndEditing and textShouldEndEditing delegate methods in MyController.swift.  This just confirms that everything is initially working correctly

2. Sort by the “name” column by clicking the column header.  Now edit a cell in the name column.  Result - textShouldEndEditing fires twice, and controlTextDidEndEditing does not fire.

3. Sort by another column.  Now edit a cell in the name column.  Result - same as #2 - controlTextDidEndEditing does not fire.

In summary, it appears that sorting a column once is enough to permanently prevent controlTextDidEndEditing from firing, even if the sort moves to another column afterward.

cl-countdown
============

cl-countdown allows you to see what buses are approaching a London bus stop,
where they are going, and how long till they are supposed to arrived.

The functionality is implemented in the `print-upcoming-bus-arrivals` function.

To query the arrival data for a particular bus stop, set ``*my-stop-id*`` to
the desired bus stop ID. You can find the ID using the
[Transport for London website](http://www.tfl.gov.uk/tfl/gettingaround/maps/buses/). Search
for your bus stop and then finds its "Stop Code" on the stop information page.

To use this package, you must have signed up for TfL API access. If you have't
already done that and want to use this package, please
[sign up here](http://www.tfl.gov.uk/businessandpartners/syndication/16492.aspx)
before proceeding.

I will be making this package much more flexible in the future.

# AC3.2-Unit3FinalAssessment

## Victoria and Albert Museum API

![Victoria and Albert](http://i4.mirror.co.uk/incoming/article8713455.ece/ALTERNATES/s615b/Prince-Albert-and-Queen-Victoria.jpg)

## Assignment

Build an app on a pattern we've been following often lately: initiate an asynchronous API call that
populates a table view with a list of items that have titles, subtitles and thumbnails. Selecting a row segues 
to a detail view controller that shows a full sized image.

Extra credit:

1. Make the search string editable by the user.
2. Update the title of the view controllers so that the title appears in the nav bar.
3. Include more textual information in the detail view.

## The API Documentation
http://www.vam.ac.uk/api

## The List

```
http://www.vam.ac.uk/api/json/museumobject/search?q=ring
```

This is a basic query and can remain static for full credit. But you can use the other query
strings and forms described in the documentation, if you like.

Iterate over the ```records``` array and extract data from the ```fields``` key:

```javascript
...
records: [
	{
		pk: 9431,
		model: "collection.museumobject",
		fields: {
			primary_image_id: "2006AM6786",
			rights: 3,
			year_start: 1540,
			object_number: "O78598",
			artist: "Unknown",
			museum_number: "M.5-1960",
			object: "Seal ring",
			longitude: "-0.12714000",
			last_processed: "2016-10-28 19:07:00",
			event_text: "",
			place: "London",
			location: "British Galleries, room 58e, case 5",
			last_checked: "2016-10-28 19:07:00",
			museum_number_token: "m51960",
			latitude: "51.50632100",
			title: "",
			date_text: "ca. 1545 (made)",
			slug: "seal-ring-unknown",
			sys_updated: "2015-02-18 00:00:00",
			collection_code: "MET"
		}
	},
.
.
.
]
```

Cell titles should be constructed from {object}, {date_text} - {place}, for example,

```
Seal ring, ca. 1545 (made), London
```

Cell subtitles should contain the ```title``` field, which is often empty.

## The Images

For the cell images construct image urls based on the file naming convention described
in the "Images and Media" portion of the documentation. Use the "o" size. For example:

```
http://media.vam.ac.uk/media/thira/collection_images/2006AM/2006AM6763_jpg_o.jpg
```

This renders as:

![image](http://media.vam.ac.uk/media/thira/collection_images/2006AM/2006AM6763_jpg_o.jpg)

And on the detail page show the full size image.

```
http://media.vam.ac.uk/media/thira/collection_images/2006AM/2006AM6763.jpg
```

![image](http://media.vam.ac.uk/media/thira/collection_images/2006AM/2006AM6763.jpg)

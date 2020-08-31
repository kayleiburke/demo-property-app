// initialize google maps

handler = Gmaps.build('Google');
handler.buildMap({
        provider: {
            disableDefaultUI: true,
            'zoomControl': true,
            'zoomControlOptions': {
                'style': google.maps.ZoomControlStyle.SMALL,
                'position': google.maps.ControlPosition[ "TOP_LEFT" ]
            },
            'panControl': false,
            'streetViewControl': false,
            'mapTypeControl': false,
            'overviewMapControl': false,
            'scrollwheel': false,
            'draggable': false,
            'mapTypeId': google.maps.MapTypeId[ "ROADMAP" ],
            'zoom': 16
        },
        internal: {
            id: 'google-fs-realestate'
        },
    },
    function(){
        markers = handler.addMarkers([
            {
                "lat": 41.257160,
                "lng": -95.995102,
                "picture": {
                    "url": "http://people.mozilla.com/~faaborg/files/shiretoko/firefoxIcon/firefox-32.png",
                    "width":  32,
                    "height": 32
                },
                "infowindow": "hello!"
            }
        ]);
        handler.bounds.extendWith(markers);
        handler.fitMapToBounds();
    }
)


google.maps.event.addListener(handler.getMap(), 'click', function(event) {
    placeMarker(event.latLng);
});

function placeMarker(location) {
    markers = handler.addMarkers([
        {
            "lat": location.lat(),
            "lng": location.lng(),
            "infowindow": "hello!" + Math.random()
        }
    ]);
    handler.bounds.extendWith(markers);
}

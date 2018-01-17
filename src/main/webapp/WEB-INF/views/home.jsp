<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <title>GST</title>
    <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?v=3&amp;sensor=false"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style type="text/css">
        #map_div {
            height: 100%;
            width: 100%;
            left: 0;
            position: absolute;
            top: 0;
        }
    </style>

    <!--<link rel="stylesheet" type="text/css" th:href="@{/css/login.css}" />-->
    <!--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">-->
    <!--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>-->
    <!--<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>-->
</head>

<body>
<div id="map_div"h ></div>
<!-- Modal -->
<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Please provide employee Information</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="email">Email:</label>
                        <div class="col-sm-10">
                            <input type="email" class="form-control" id="email" placeholder="Enter email">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="firstName">First Name:</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="firstName" placeholder="Enter First Name">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="lastName">Last Name:</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="lastName" placeholder="Enter Last Name">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="education">Education:</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="education" placeholder="Enter Education">
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <button type="button" id="saveEmployee" class="btn btn-default">Submit</button>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
            </div>
        </div>

    </div>
</div>

<script type="application/javascript">
    /*
     * declare map as a global variable
     */
    var map;

    /*
     * use google maps api built-in mechanism to attach dom events
     */
    google.maps.event.addDomListener(window, "load", function () {

        /*
         * create map
         */
        var map = new google.maps.Map(document.getElementById("map_div"), {
            center: new google.maps.LatLng(33.808678, -117.918921),
            zoom: 14,
            mapTypeId: google.maps.MapTypeId.ROADMAP
        });

        /*
         * create infowindow (which will be used by markers)
         */
        var infoWindow = new google.maps.InfoWindow();

        /*
         * marker creater function (acts as a closure for html parameter)
         */
        function createMarker(options, html) {
            var marker = new google.maps.Marker(options);
            if (html) {
                google.maps.event.addListener(marker, "click", function () {
                    infoWindow.setContent(html);
                    infoWindow.open(options.map, this);
                });
            }
            return marker;
        }

        /*
         lat and lng
         */
        var markersData = [[33.808678, -117.918921], [33.818038, -117.928492], [33.803333, -117.915278], [33.803000, -117.915500]]


        /*
         * add markers to map
         */

        for (var i = 0; i < markersData.length; i++) {
            createMarker({
                position: new google.maps.LatLng(markersData[i][0], markersData[i][1]),
                map: map,
                icon: "http://1.bp.blogspot.com/_GZzKwf6g1o8/S6xwK6CSghI/AAAAAAAAA98/_iA3r4Ehclk/s1600/marker-green.png"
            }, "<h1>Hi {{name}}</h1><p>This is {{location}}}.</p><button type='button' class='btn btn-info' data-toggle='modal' data-target='#myModal'>Add Information</button>");
        }

    });

    jQuery(document).ready(function() {
        $('#saveEmployee').click(function () {
            saveEmployee();
        });
    });

    function saveEmployee() {
        $.ajax({
            url: '/employees/save',
            dataType: 'json',
            type: 'post',
            contentType: 'application/json',
            data: JSON.stringify({
                "education": $('#education').val(),
                "lastName": $('#lastName').val(),
                "firstName": $('#firstName').val(),
                "email": $('#email').val()
            }),
            processData: false,
            success: function (data, textStatus, jQxhr) {
                $("#myModal").modal("hide");
            },
            error: function (jqXhr, textStatus, errorThrown) {
                alert("ERR: " + jqXhr.responseText + errorThrown);
                console.log(errorThrown);
            }
        });
    }



</script>
</body>
</html>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <title>GSK-CSR</title>
    <script type="text/javascript"
            src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAe-E46f1dCFCBvNnanm6K_0ZPufBa4d3A&amp;sensor=false"></script>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-validate/1.17.0/jquery.validate.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style type="text/css">
        #map_div {
            height: 100%;
            width: 100%;
            left: 0;
            position: absolute;
            top: 0;
        }

        #saveEmployee {
            margin-top: 30%;
            width: 70%;
            border-radius: 25px;
            background-color: #ff7010;
        }

        .slant {
            -webkit-transform: skewX(-13.5deg);
            -moz-transform: skewX(-13.5deg);
            -ms-transform: skewX(-13.5deg);
            -o-transform: skewX(-14.5deg);
            transform: skewX(-13.5deg);
            -webkit-backface-visibility: hidden;
        }

        #volunteer {
            margin-top: 3%;
            width: 20%;
            border-radius: 25px;
            background-color: #ff7010;
        }

        #registrationForm input {
            border: none;
            text-align: center
        }

    </style>

    <!--<link rel="stylesheet" type="text/css" th:href="@{/css/login.css}" />-->
    <!--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">-->
    <!--<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>-->
    <!--<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>-->
</head>

<body>
<div id="map_div"></div>
<!-- Modal -->
<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog" style="width:18%;">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header" style="border-bottom: none;margin-bottom: 20% ">
                <%--<button type="button" class="close" data-dismiss="modal">&times;</button>--%>
                <h4 class="modal-title"><img width="7%" data-dismiss="modal"
                                             src="http://www.clker.com/cliparts/X/K/I/w/c/U/icon-previous-orange-brown-md.png"/>
                </h4>
            </div>
            <div class="modal-body">
                <form action="" id="registrationForm" class="form-horizontal">
                    <div class="form-group">
                        <div class="col-sm-12">
                            <input type="text" class="form-control" id="name" name="name" placeholder="NAME">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-12">
                            <input type="text" class="form-control" id="mobile" name="mobile" placeholder="PHONE NO.">
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-sm-12">
                            <input type="text" class="form-control" id="email" name="email" placeholder="E-EMAIL">
                        </div>
                    </div>


                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                            <button type="button" id="saveEmployee" class="btn">Submit</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>

    </div>
</div>

<script type="application/javascript">
    /*
     * declare map as a global variable
     */
    var map;

    var popup = '<div class="cotainer" style="width: 100%">  <div class="panel">    <div class="panel-heading">' +
            '      <div class=""><big><strong style="color:#ff7010">PROGRAM_DETAILS</strong></big></div>' +
            '      <div> Partner: PROJECT_PARTNER</div>    </div>  ' +
            '  <hr style="border-color: #ff7010">    <div class="panel-body">   ' +
            '   <div><span style="background-color:#ff7010;color:white;padding:0.5%;padding-right: 1%">' +
            '<img src="https://d30y9cdsu7xlg0.cloudfront.net/png/303335-200.png" width="2%" style="margin-left: 1%;margin-right: 1%"/><strong> Program strategy:</strong></span></div>      <br/>      <ul>        <li>Providig fortified nutritious food to school children through mid-day meal programme everyday</li>   ' +
            '     <li> Providing milk to the children thrice a week</li>     ' +
            '   <li> Focus on improving school performance, student retention and drop out rates </li> ' +
            '    </ul> ' +
            '     <div class="row-fluid">        ' +
            '<div class="col-sm-3" style="background-color:#ff7010;color:white;padding:0.5%">  ' +
            '        <div><strong>Target stackeholder/s</strong></div>          <div>Gorvernment school children</div>  ' +
            '      </div>        <div class="col-sm-4">          <div><strong>Location/s</strong></div>       ' +
            '   <div>EVENT_LOCATION</div>        </div>        <div class="col-sm-4" style="background-color:#ff7010;color:white;padding:0.5%">          <div><strong>Projected outreach</strong></div>          <div>50,000 children across 400 schools</div>        </div>      </div>      <div class="form-group">     ' +
            '   <div class="col-sm-offset-4 col-sm-12">          <button type="button" id="volunteer" class="btn" data-toggle="modal" data-target="#myModal">VOLUNTEER</button>        </div>      </div>    </div>  </div></div>'


    $.ajax({
        url: '/locations',
        type: 'get',
        success: function (data, textStatus, jQxhr) {
            initMap(data)
        },
        error: function (jqXhr, textStatus, errorThrown) {
            alert("ERR: " + jqXhr.responseText + errorThrown);
            console.log(errorThrown);
        }
    });

        var mapOptions = [{
        featureType: "all",
        elementType: "all",
        stylers: [{color: "#eae8e8"}, {saturation: -50}]
        }, {
        featureType: "road",
        elementType: "geometry",
        stylers: [{color: "#ffffff"}]
        }, {
        featureType: "landscape.natural",
        elementType: "geometry",
        stylers: [{color: "#f4f4f4"}]
        }, {featureType: "landscape", elementType: "labels", stylers: [{visibility: "off"}]}, {
        featureType: "all",
        elementType: "labels.text.fill",
        stylers: [{color: "#666666"}]
        }];

    function initMap(markersData) {
        /*
         * use google maps api built-in mechanism to attach dom events
         */
        google.maps.event.addDomListener(window, "load", function () {

            /*
             * create map
             */
            var map = new google.maps.Map(document.getElementById("map_div"), {
                center: new google.maps.LatLng(28.631451, 77.216667),
                zoom: 5,
                mapTypeId: google.maps.MapTypeId.ROADMAP
            });

            map.setOptions(mapOptions);

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
             * add markers to map
             */

            for (var i = 0; i < markersData.length; i++) {
                createMarker({
                    position: new google.maps.LatLng(markersData[i].lat, markersData[i].lng),
                    map: map,
                    icon: "http://1.bp.blogspot.com/_GZzKwf6g1o8/S6xwK6CSghI/AAAAAAAAA98/_iA3r4Ehclk/s1600/marker-orange.png"
                }, popup.replace("EVENT_LOCATION",markersData[i].geographic).
                        replace("PROJECT_PARTNER",markersData[i].projectPartner).
                        replace("PROGRAM_DETAILS",markersData[i].program));
            }

        });
    }

    jQuery(document).ready(function () {
        $('#saveEmployee').click(function () {
            if ($("#registrationForm").valid()) {
                saveEmployee();

            }
        });

        $("#registrationForm").validate({
            // Specify validation rules
            rules: {
                // The key name on the left side is the name attribute
                // of an input field. Validation rules are defined
                // on the right side
                name: "required",
                email: {
                    required: true,
                    // Specify that email should be validated
                    // by the built-in "email" rule
                    email: true
                },
                mobile: {
                    required: true,
                    minlength: 9,
                    maxlength: 10,
                    number: true
                }
            },
            // Specify validation error messages
            messages: {
                name: "Please enter your name",
                email: "Please enter a valid email address",
                mobile: "Please enter a valid mobile number"
            }
        });
    });

    function saveEmployee() {
        $.ajax({
            url: '/employees/save',
            dataType: 'json',
            type: 'post',
            contentType: 'application/json',
            data: JSON.stringify({
                "mobile": $('#mobile').val(),
                "name": $('#name').val(),
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
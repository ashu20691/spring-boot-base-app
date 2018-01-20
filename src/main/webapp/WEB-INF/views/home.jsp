<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
    <title>GSK-CSR</title>
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAe-E46f1dCFCBvNnanm6K_0ZPufBa4d3A&amp;sensor=false"></script>
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
    <div class="modal-dialog" style="width:40%;">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Please provide the following Information</h4>
            </div>
            <div class="modal-body">
                <form action="" id="registrationForm" class="form-horizontal">
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="email">Email:</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="email" name="email" placeholder="Enter email">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="firstName">First Name:</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="firstName" name="firstName" placeholder="Enter First Name">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="lastName">Last Name:</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="lastName" name="lastName" placeholder="Enter Last Name">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-2" for="mobile">Mobile No.:</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="mobile" name="mobile" placeholder="Enter Mobile No.">
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

    function initMap(markersData){
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
             * add markers to map
             */

            for (var i = 0; i < markersData.length; i++) {
                createMarker({
                    position: new google.maps.LatLng(markersData[i].lat, markersData[i].lng),
                    map: map,
                    icon: "http://1.bp.blogspot.com/_GZzKwf6g1o8/S6xwK6CSghI/AAAAAAAAA98/_iA3r4Ehclk/s1600/marker-green.png"
                }, "<h1>Hi Folk</h1><p>Want to Volunteer?.</p><a href='#' class='' data-toggle='modal' data-target='#myModal'>Please Click here to add yourself</a>");
            }

        });
    }

    jQuery(document).ready(function() {
        $('#saveEmployee').click(function () {
            if($("#registrationForm").valid()){
                saveEmployee();

            }
        });

        $("#registrationForm").validate({
            // Specify validation rules
            rules: {
                // The key name on the left side is the name attribute
                // of an input field. Validation rules are defined
                // on the right side
                firstName: "required",
                lastName: "required",
                email: {
                    required: true,
                    // Specify that email should be validated
                    // by the built-in "email" rule
                    email: true
                },
                mobile: {
                    required:true,
                    minlength:9,
                    maxlength:10,
                    number: true
                }
            },
            // Specify validation error messages
            messages: {
                firstName: "Please enter your firstname",
                lastName: "Please enter your lastname",
                email: "Please enter a valid email address",
                mobile : "Please enter a valid mobile number"
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
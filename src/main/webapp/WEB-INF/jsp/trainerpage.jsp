<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>MySchool</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
              integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script
            src="https://code.jquery.com/jquery-3.4.1.js"
            integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
        crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <script> src = bootstrap.min.css</script>
        <script> src = bootstrap.bundle.min.js</script>
        <link rel="stylesheet" type="text/css" href="mystyle.css">
    </head>

    <body>

        <div class="container">
            <div class="card border-0 shadow my-5">
                <div class="card-body p-5">
                    <div>
                        <h3 style="font-family:sans-serif; margin-bottom: -1em;">Trainers</h3>
                        <button type="button" class="btn btn-secondary" data-toggle="modal" data-target="#addModal" style="float: right; margin-bottom: 1em;"><i
                                class="fa fa-plus"></i><b>Add</b>
                        </button>
                    </div>
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th scope="col">id</th>
                                <th scope="col">First Name</th>
                                <th scope="col">Last Name</th>
                                <th scope="col">Subject</th>
                                <th scope="col"></th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${alltrainers}" var="t">                                                       
                                <tr>
                                    <td>${t.trainerId}</td>
                                    <td>${t.trainerFirstname}</td>
                                    <td>${t.trainerLastname}</td>
                                    <td>${t.trainerSubject}</td>
                                    <td><button title="Edit" data-toggle="modal" data-target="#editModal" class="btn btn-success btn-sm" trainer-id="${t.trainerId}" first-name="${t.trainerFirstname}"
                                                last-name="${t.trainerLastname}" subject="${t.trainerSubject}"style="background-color: rgb(28, 94, 83);"><i class="fa fa-edit"></i></button>
                                        <span><a href="deletetrainer/${t.trainerId}"><button title="Delete" class="btn btn-success btn-sm" role="button"
                                                                                             style="background-color: rgb(0, 128, 107);"><i class="fa fa-trash"></i></button></a></span></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>

            <div class="modal fade" id="editModal">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="card-body p-5">
                            <h3 style="font-family:sans-serif;">Edit Trainer</h3>
                            <div>
                                <form id="profileForm" action="update" method="post">
                                    <input hidden="true"  name="id" value="">

                                    <label>First Name</label>
                                    <input type="text" required pattern="[a-zA-Z]*" maxlength="25" id="firstName" name="firstname"
                                           value="" placeholder="Only characters allowed..">

                                    <label>Last Name</label>
                                    <input type="text" required pattern="[a-zA-Z]*" maxlength="25" id="lastName" name="lastname" 
                                           value="" placeholder="Only characters allowed..">

                                    <label>Subject</label>
                                    <input type="text" maxlength="25" id="subject" name="subject"
                                           value="" placeholder="Only characters allowed.."><br>

                                    <input type="submit" value="Submit">

                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="modal fade" id="addModal">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="card-body p-5">
                            <h3 style="font-family:sans-serif;">Add New Trainer</h3>
                            <div>
                                <form id="profileForm" action="inserttrainer" method="post">
                                    <label >First Name</label>
                                    <input type="text" required pattern="[a-zA-Z]*"  maxlength="15" id="firstName" name="firstname" placeholder="Only characters allowed..">

                                    <label >Last Name</label>
                                    <input type="text" required pattern="[a-zA-Z]*"  maxlength="15" id="lastName" name="lastname" placeholder="Only characters allowed..">

                                    <label >Subject</label>
                                    <input type="text" maxlength="15" id="subject" name="subject" placeholder="Only characters allowed.."><br>

                                    <input type="submit" value="Submit">

                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
    <script>
        $('#editModal').on('show.bs.modal', function (e) {
            var opener = e.relatedTarget;
            var id = $(opener).attr('trainer-id');
            var firstname = $(opener).attr('first-name');
            var lastname = $(opener).attr('last-name');
            var subject = $(opener).attr('subject');

            $('#profileForm').find('[name="id"]').val(id);
            $('#profileForm').find('[name="firstname"]').val(firstname);
            $('#profileForm').find('[name="lastname"]').val(lastname);
            $('#profileForm').find('[name="subject"]').val(subject);

        });

        $('#profileForm').on('submit', function () {
            var form = $(this);
            $.ajax({
                url: form.attr("action"),
                method: form.attr("method"),
                data: form.serialize()

            });

        });
    </script>
</body>

</html>


function showModal(title, modal_body){
    $("#main_modal .modal-title").html(title);
    $("#main_modal .modal-body").html(modal_body);
    $("#main_modal").modal("show");
}
$(document).ready(function() {
    $("#main_modal .close").click(function(){
        $("#main_modal").modal("hide");
    });
});
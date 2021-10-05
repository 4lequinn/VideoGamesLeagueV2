
// Funciones de alerta para el formulario de usuario

function eliminarUsuario(usuario) {
    Swal.fire({
        icon: 'warning',
        title: '¿Estás Seguro?',
        text: '¡No podrás deshacer la acción!',
        showCancelButton: true,
        cancelButtonColor: "#d33",
        cancelButtonText: "Cancelar",
        confirmButtonText: "Si, Eliminar",
    }).then((result) => {
        if (result.value) {
            Swal.fire(
                    '¡Eliminado!',
                    'Usuario Eliminado correctamente',
                    'success'
                    ).then(function () {
                window.location.href = "ControladorUsuario?usuario=" + (usuario);
            })
        }
    })
}


function eliminarLiga(liga) {
    Swal.fire({
        icon: 'warning',
        title: '¿Estás Seguro?',
        text: '¡No podrás deshacer la acción!',
        showCancelButton: true,
        cancelButtonColor: "#d33",
        cancelButtonText: "Cancelar",
        confirmButtonText: "Si, Eliminar",
    }).then((result) => {
        if (result.value) {
            Swal.fire(
                    '¡Eliminado!',
                    'Liga Eliminada correctamente',
                    'success'
                    ).then(function () {
                window.location.href = "ControladorAdminLiga?liga=" + (liga);
            })
        }
    })
}

function eliminarEquipo(equipo) {
    console.log(equipo);
    Swal.fire({
        icon: 'warning',
        title: '¿Estás Seguro?',
        text: '¡No podrás deshacer la acción!',
        showCancelButton: true,
        cancelButtonColor: "#d33",
        cancelButtonText: "Cancelar",
        confirmButtonText: "Si, Eliminar",
    }).then((result) => {
        if (result.value) {
            Swal.fire(
                    '¡Eliminado!',
                    'Equipo Eliminado correctamente',
                    'success'
                    ).then(function () {
                window.location.href = "ControladorAdminEquipo?equipo=" + (equipo);
            })
        }
    })
}

function mostrarAlerta(titulo, descripcion, tipoAleta) {
    swal.fire(
            titulo,
            descripcion,
            tipoAleta
    );
}
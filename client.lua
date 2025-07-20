RegisterCommand('dv', function()
    local playerPed = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(playerPed, false)

    if vehicle and vehicle ~= 0 then
        if GetPedInVehicleSeat(vehicle, -1) == playerPed then
            NetworkRequestControlOfEntity(vehicle)
            Wait(100)
            SetEntityAsMissionEntity(vehicle, true, true)
            DeleteVehicle(vehicle)

            lib.notify({
                title = 'Vehicle Deleted',
                description = 'Successfully deleted vehicle.',
                type = 'success'
            })
        else
            lib.notify({
                title = 'Error',
                description = 'You must be the driver to delete the vehicle.',
                type = 'error'
            })
        end
    else
        lib.notify({
            title = 'No Vehicle',
            description = 'You are not in a vehicle.',
            type = 'error'
        })
    end
end, false)

RegisterCommand('testnotif', function()
    lib.notify({
        title = 'Notification Test',
        description = 'If you see this, ox_lib is working.',
        type = 'success'
    })
end, false)
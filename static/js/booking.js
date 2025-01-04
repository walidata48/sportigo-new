function showAvailableSlots() {
    // After date selection
    $.post('/get_available_slots', {
        location_id: $('#location_id').val(),
        date: $('#date').val()
    }, function(response) {
        // Display time slots with remaining quota
        let slotsHtml = '';
        response.available_slots.forEach(slot => {
            slotsHtml += `
                <div class="time-slot" onclick="selectTimeSlot('${slot.start_time}', '${slot.end_time}')">
                    ${slot.start_time} - ${slot.end_time}
                    (${slot.available}/${slot.total_quota} available)
                </div>
            `;
        });
        $('#time-slots').html(slotsHtml);
    });
}

function selectTimeSlot(startTime, endTime) {
    // After time slot selection
    $.post('/get_consecutive_dates', {
        location_id: $('#location_id').val(),
        date: $('#date').val(),
        start_time: startTime,
        end_time: endTime
    }, function(response) {
        // Display consecutive dates table
        let datesHtml = `<h3>${response.location_name}</h3><table>`;
        response.consecutive_dates.forEach(date => {
            datesHtml += `
                <tr>
                    <td>${date.formatted_date}</td>
                    <td>(${date.start_time}-${date.end_time})</td>
                </tr>
            `;
        });
        datesHtml += '</table>';
        
        // Add confirm and back buttons
        datesHtml += `
            <button onclick="confirmBooking('${response.consecutive_dates[0].date}', '${startTime}', '${endTime}')">Confirm</button>
            <button onclick="goBack()">Back</button>
        `;
        
        $('#booking-details').html(datesHtml);
    });
}

function confirmBooking(date, startTime, endTime) {
    window.location.href = `/confirm_booking?location_id=${$('#location_id').val()}&date=${date}&start_time=${startTime}&end_time=${endTime}`;
}

function goBack() {
    // Handle back button to previous step
    $('#booking-details').hide();
    $('#time-slots').show();
} 
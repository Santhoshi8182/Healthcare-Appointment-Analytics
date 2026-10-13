
USE healthcare_db;

-- 1. Total appointments
SELECT COUNT(*) AS total_appointments
FROM appointments;

-- 2. Attended appointments
SELECT COUNT(*) AS attended_appointments
FROM appointments
WHERE `No-show` = 'No';

-- 3. Missed appointments
SELECT COUNT(*) AS no_show_appointments
FROM appointments
WHERE `No-show` = 'Yes';

-- 4. Overall no-show percentage
SELECT
    ROUND(
        100.0 * SUM(CASE WHEN `No-show` = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS no_show_percentage
FROM appointments;

-- 5. Missed appointments by gender
SELECT
    Gender,
    COUNT(*) AS no_show_appointments
FROM appointments
WHERE `No-show` = 'Yes'
GROUP BY Gender;

-- 6. Missed appointments by age group
SELECT
    CASE
        WHEN Age <= 12 THEN 'Children'
        WHEN Age <= 19 THEN 'Teenagers'
        WHEN Age <= 35 THEN 'Young Adults'
        WHEN Age <= 60 THEN 'Adults'
        ELSE 'Seniors'
    END AS age_group,
    COUNT(*) AS no_show_appointments
FROM appointments
WHERE `No-show` = 'Yes'
GROUP BY age_group
ORDER BY no_show_appointments DESC;

-- 7. No-show rate by SMS status
SELECT
    SMS_received,
    COUNT(*) AS total_appointments,
    SUM(CASE WHEN `No-show` = 'Yes' THEN 1 ELSE 0 END)
        AS no_show_appointments,
    ROUND(
        100.0 * SUM(CASE WHEN `No-show` = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS no_show_percentage
FROM appointments
GROUP BY SMS_received;

-- 8. No-show rate by waiting-time group
SELECT
    CASE
        WHEN DATEDIFF(AppointmentDay, ScheduledDay) < 0
            THEN 'Invalid'
        WHEN DATEDIFF(AppointmentDay, ScheduledDay) = 0
            THEN 'Same Day'
        WHEN DATEDIFF(AppointmentDay, ScheduledDay) <= 7
            THEN '1-7 Days'
        WHEN DATEDIFF(AppointmentDay, ScheduledDay) <= 30
            THEN '8-30 Days'
        ELSE 'Over 30 Days'
    END AS waiting_group,
    COUNT(*) AS total_appointments,
    SUM(CASE WHEN `No-show` = 'Yes' THEN 1 ELSE 0 END)
        AS no_show_appointments,
    ROUND(
        100.0 * SUM(CASE WHEN `No-show` = 'Yes' THEN 1 ELSE 0 END)
        / COUNT(*),
        2
    ) AS no_show_percentage
FROM appointments
GROUP BY waiting_group
ORDER BY no_show_percentage DESC;

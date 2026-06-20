//! This file was generated from a FIT profile. Do not edit by hand.
//! Instead, run this command: 'tools/gen-profile-types.py global-profile/enums.csv global-profile/messages.csv'
const std = @import("std");
const decoder = @import("../decoder.zig");
const assert = std.debug.assert;

pub const File = enum(u8) {
    /// Read only, single file. Must be in root directory.
    device = 1,
    /// Read/write, single file. Directory=Settings
    settings = 2,
    /// Read/write, multiple files, file number = sport type. Directory=Sports
    sport = 3,
    /// Read/erase, multiple files. Directory=Activities
    activity = 4,
    /// Read/write/erase, multiple files. Directory=Workouts
    workout = 5,
    /// Read/write/erase, multiple files. Directory=Courses
    course = 6,
    /// Read/write, single file. Directory=Schedules
    schedules = 7,
    /// Read only, single file. Circular buffer. All message definitions at start of file. Directory=Weight
    weight = 9,
    /// Read only, single file. Directory=Totals
    totals = 10,
    /// Read/write, single file. Directory=Goals
    goals = 11,
    /// Read only. Directory=Blood Pressure
    blood_pressure = 14,
    /// Read only. Directory=Monitoring. File number=sub type.
    monitoring_a = 15,
    /// Read/erase, multiple files. Directory=Activities
    activity_summary = 20,
    monitoring_daily = 28,
    /// Read only. Directory=Monitoring. File number=identifier
    monitoring_b = 32,
    /// Read/write/erase. Multiple Files. Directory=Segments
    segment = 34,
    /// Read/write/erase. Single File. Directory=Segments
    segment_list = 35,
    /// Read/write/erase. Single File. Directory=Settings
    exd_configuration = 40,
    /// 0xF7 - 0xFE reserved for manufacturer specific file types
    mfg_range_min = 0xF7,
    /// 0xF7 - 0xFE reserved for manufacturer specific file types
    mfg_range_max = 0xFE,
};

pub const MesgNum = enum(u16) {
    file_id = 0,
    capabilities = 1,
    device_settings = 2,
    user_profile = 3,
    hrm_profile = 4,
    sdm_profile = 5,
    bike_profile = 6,
    zones_target = 7,
    hr_zone = 8,
    power_zone = 9,
    met_zone = 10,
    sport = 12,
    training_settings = 13,
    goal = 15,
    session = 18,
    lap = 19,
    record = 20,
    event = 21,
    device_info = 23,
    workout = 26,
    workout_step = 27,
    schedule = 28,
    weight_scale = 30,
    course = 31,
    course_point = 32,
    totals = 33,
    activity = 34,
    software = 35,
    file_capabilities = 37,
    mesg_capabilities = 38,
    field_capabilities = 39,
    file_creator = 49,
    blood_pressure = 51,
    speed_zone = 53,
    monitoring = 55,
    training_file = 72,
    hrv = 78,
    ant_rx = 80,
    ant_tx = 81,
    ant_channel_id = 82,
    length = 101,
    monitoring_info = 103,
    pad = 105,
    slave_device = 106,
    connectivity = 127,
    weather_conditions = 128,
    weather_alert = 129,
    cadence_zone = 131,
    hr = 132,
    segment_lap = 142,
    memo_glob = 145,
    segment_id = 148,
    segment_leaderboard_entry = 149,
    segment_point = 150,
    segment_file = 151,
    workout_session = 158,
    watchface_settings = 159,
    gps_metadata = 160,
    camera_event = 161,
    timestamp_correlation = 162,
    gyroscope_data = 164,
    accelerometer_data = 165,
    three_d_sensor_calibration = 167,
    video_frame = 169,
    obdii_data = 174,
    nmea_sentence = 177,
    aviation_attitude = 178,
    video = 184,
    video_title = 185,
    video_description = 186,
    video_clip = 187,
    ohr_settings = 188,
    exd_screen_configuration = 200,
    exd_data_field_configuration = 201,
    exd_data_concept_configuration = 202,
    field_description = 206,
    developer_data_id = 207,
    magnetometer_data = 208,
    barometer_data = 209,
    one_d_sensor_calibration = 210,
    monitoring_hr_data = 211,
    time_in_zone = 216,
    set = 225,
    stress_level = 227,
    max_met_data = 229,
    dive_settings = 258,
    dive_gas = 259,
    dive_alarm = 262,
    exercise_title = 264,
    dive_summary = 268,
    spo2_data = 269,
    sleep_level = 275,
    jump = 285,
    aad_accel_features = 289,
    beat_intervals = 290,
    respiration_rate = 297,
    hsa_accelerometer_data = 302,
    hsa_step_data = 304,
    hsa_spo2_data = 305,
    hsa_stress_data = 306,
    hsa_respiration_data = 307,
    hsa_heart_rate_data = 308,
    split = 312,
    split_summary = 313,
    hsa_body_battery_data = 314,
    hsa_event = 315,
    climb_pro = 317,
    tank_update = 319,
    tank_summary = 323,
    sleep_assessment = 346,
    hrv_status_summary = 370,
    hrv_value = 371,
    raw_bbi = 372,
    device_aux_battery_info = 375,
    hsa_gyroscope_data = 376,
    chrono_shot_session = 387,
    chrono_shot_data = 388,
    hsa_configuration_data = 389,
    dive_apnea_alarm = 393,
    skin_temp_overnight = 398,
    /// Message number for the HSA wrist temperature data message
    hsa_wrist_temperature_data = 409,
    nap_event = 412,
    sleep_disruption_severity_period = 470,
    sleep_disruption_overnight_severity = 471,
    /// 0xFF00 - 0xFFFE reserved for manufacturer specific messages
    mfg_range_min = 0xFF00,
    /// 0xFF00 - 0xFFFE reserved for manufacturer specific messages
    mfg_range_max = 0xFFFE,
};

pub const Checksum = enum(u8) {
    /// Allows clear of checksum for flash memory where can only write 1 to 0 without erasing sector.
    clear = 0,
    /// Set to mark checksum as valid if computes to invalid values 0 or 0xFF. Checksum can also be set to ok to save encoding computation time.
    ok = 1,
};

pub const FileFlags = enum(u8) {
    read = 0x02,
    write = 0x04,
    erase = 0x08,
};

pub const MesgCount = enum(u8) {
    num_per_file = 0,
    max_per_file = 1,
    max_per_file_type = 2,
};

/// seconds since UTC 00:00 Dec 31 1989
pub const DateTime = enum(u32) {
    /// if date_time is < 0x10000000 then it is system time (seconds from device power on)
    min = 0x10000000,
};

/// seconds since 00:00 Dec 31 1989 in local time zone
pub const LocalDateTime = enum(u32) {
    /// if date_time is < 0x10000000 then it is system time (seconds from device power on)
    min = 0x10000000,
};

pub const MessageIndex = enum(u16) {
    /// message is selected if set
    selected = 0x8000,
    /// reserved (default 0)
    reserved = 0x7000,
    /// index
    mask = 0x0FFF,
};

pub const DeviceIndex = enum(u8) {
    /// Creator of the file is always device index 0.
    creator = 0,
};

pub const Gender = enum(u8) {
    female = 0,
    male = 1,
};

pub const Language = enum(u8) {
    english = 0,
    french = 1,
    italian = 2,
    german = 3,
    spanish = 4,
    croatian = 5,
    czech = 6,
    danish = 7,
    dutch = 8,
    finnish = 9,
    greek = 10,
    hungarian = 11,
    norwegian = 12,
    polish = 13,
    portuguese = 14,
    slovakian = 15,
    slovenian = 16,
    swedish = 17,
    russian = 18,
    turkish = 19,
    latvian = 20,
    ukrainian = 21,
    arabic = 22,
    farsi = 23,
    bulgarian = 24,
    romanian = 25,
    chinese = 26,
    japanese = 27,
    korean = 28,
    taiwanese = 29,
    thai = 30,
    hebrew = 31,
    brazilian_portuguese = 32,
    indonesian = 33,
    malaysian = 34,
    vietnamese = 35,
    burmese = 36,
    mongolian = 37,
    custom = 254,
};

/// Bit field corresponding to language enum type (1 << language).
pub const LanguageBits0 = enum(u8) {
    english = 0x01,
    french = 0x02,
    italian = 0x04,
    german = 0x08,
    spanish = 0x10,
    croatian = 0x20,
    czech = 0x40,
    danish = 0x80,
};

pub const LanguageBits1 = enum(u8) {
    dutch = 0x01,
    finnish = 0x02,
    greek = 0x04,
    hungarian = 0x08,
    norwegian = 0x10,
    polish = 0x20,
    portuguese = 0x40,
    slovakian = 0x80,
};

pub const LanguageBits2 = enum(u8) {
    slovenian = 0x01,
    swedish = 0x02,
    russian = 0x04,
    turkish = 0x08,
    latvian = 0x10,
    ukrainian = 0x20,
    arabic = 0x40,
    farsi = 0x80,
};

pub const LanguageBits3 = enum(u8) {
    bulgarian = 0x01,
    romanian = 0x02,
    chinese = 0x04,
    japanese = 0x08,
    korean = 0x10,
    taiwanese = 0x20,
    thai = 0x40,
    hebrew = 0x80,
};

pub const LanguageBits4 = enum(u8) {
    brazilian_portuguese = 0x01,
    indonesian = 0x02,
    malaysian = 0x04,
    vietnamese = 0x08,
    burmese = 0x10,
    mongolian = 0x20,
};

pub const TimeZone = enum(u8) {
    almaty = 0,
    bangkok = 1,
    bombay = 2,
    brasilia = 3,
    cairo = 4,
    cape_verde_is = 5,
    darwin = 6,
    eniwetok = 7,
    fiji = 8,
    hong_kong = 9,
    islamabad = 10,
    kabul = 11,
    magadan = 12,
    mid_atlantic = 13,
    moscow = 14,
    muscat = 15,
    newfoundland = 16,
    samoa = 17,
    sydney = 18,
    tehran = 19,
    tokyo = 20,
    us_alaska = 21,
    us_atlantic = 22,
    us_central = 23,
    us_eastern = 24,
    us_hawaii = 25,
    us_mountain = 26,
    us_pacific = 27,
    other = 28,
    auckland = 29,
    kathmandu = 30,
    europe_western_wet = 31,
    europe_central_cet = 32,
    europe_eastern_eet = 33,
    jakarta = 34,
    perth = 35,
    adelaide = 36,
    brisbane = 37,
    tasmania = 38,
    iceland = 39,
    amsterdam = 40,
    athens = 41,
    barcelona = 42,
    berlin = 43,
    brussels = 44,
    budapest = 45,
    copenhagen = 46,
    dublin = 47,
    helsinki = 48,
    lisbon = 49,
    london = 50,
    madrid = 51,
    munich = 52,
    oslo = 53,
    paris = 54,
    prague = 55,
    reykjavik = 56,
    rome = 57,
    stockholm = 58,
    vienna = 59,
    warsaw = 60,
    zurich = 61,
    quebec = 62,
    ontario = 63,
    manitoba = 64,
    saskatchewan = 65,
    alberta = 66,
    british_columbia = 67,
    boise = 68,
    boston = 69,
    chicago = 70,
    dallas = 71,
    denver = 72,
    kansas_city = 73,
    las_vegas = 74,
    los_angeles = 75,
    miami = 76,
    minneapolis = 77,
    new_york = 78,
    new_orleans = 79,
    phoenix = 80,
    santa_fe = 81,
    seattle = 82,
    washington_dc = 83,
    us_arizona = 84,
    chita = 85,
    ekaterinburg = 86,
    irkutsk = 87,
    kaliningrad = 88,
    krasnoyarsk = 89,
    novosibirsk = 90,
    petropavlovsk_kamchatskiy = 91,
    samara = 92,
    vladivostok = 93,
    mexico_central = 94,
    mexico_mountain = 95,
    mexico_pacific = 96,
    cape_town = 97,
    winkhoek = 98,
    lagos = 99,
    riyahd = 100,
    venezuela = 101,
    australia_lh = 102,
    santiago = 103,
    manual = 253,
    automatic = 254,
};

pub const DisplayMeasure = enum(u8) {
    metric = 0,
    statute = 1,
    nautical = 2,
};

pub const DisplayHeart = enum(u8) {
    bpm = 0,
    max = 1,
    reserve = 2,
};

pub const DisplayPower = enum(u8) {
    watts = 0,
    percent_ftp = 1,
};

pub const DisplayPosition = enum(u8) {
    /// dd.dddddd
    degree = 0,
    /// dddmm.mmm
    degree_minute = 1,
    /// dddmmss
    degree_minute_second = 2,
    /// Austrian Grid (BMN)
    austrian_grid = 3,
    /// British National Grid
    british_grid = 4,
    /// Dutch grid system
    dutch_grid = 5,
    /// Hungarian grid system
    hungarian_grid = 6,
    /// Finnish grid system Zone3 KKJ27
    finnish_grid = 7,
    /// Gausss Krueger (German)
    german_grid = 8,
    /// Icelandic Grid
    icelandic_grid = 9,
    /// Indonesian Equatorial LCO
    indonesian_equatorial = 10,
    /// Indonesian Irian LCO
    indonesian_irian = 11,
    /// Indonesian Southern LCO
    indonesian_southern = 12,
    /// India zone 0
    india_zone_0 = 13,
    /// India zone IA
    india_zone_IA = 14,
    /// India zone IB
    india_zone_IB = 15,
    /// India zone IIA
    india_zone_IIA = 16,
    /// India zone IIB
    india_zone_IIB = 17,
    /// India zone IIIA
    india_zone_IIIA = 18,
    /// India zone IIIB
    india_zone_IIIB = 19,
    /// India zone IVA
    india_zone_IVA = 20,
    /// India zone IVB
    india_zone_IVB = 21,
    /// Irish Transverse Mercator
    irish_transverse = 22,
    /// Irish Grid
    irish_grid = 23,
    /// Loran TD
    loran = 24,
    /// Maidenhead grid system
    maidenhead_grid = 25,
    /// MGRS grid system
    mgrs_grid = 26,
    /// New Zealand grid system
    new_zealand_grid = 27,
    /// New Zealand Transverse Mercator
    new_zealand_transverse = 28,
    /// Qatar National Grid
    qatar_grid = 29,
    /// Modified RT-90 (Sweden)
    modified_swedish_grid = 30,
    /// RT-90 (Sweden)
    swedish_grid = 31,
    /// South African Grid
    south_african_grid = 32,
    /// Swiss CH-1903 grid
    swiss_grid = 33,
    /// Taiwan Grid
    taiwan_grid = 34,
    /// United States National Grid
    united_states_grid = 35,
    /// UTM/UPS grid system
    utm_ups_grid = 36,
    /// West Malayan RSO
    west_malayan = 37,
    /// Borneo RSO
    borneo_rso = 38,
    /// Estonian grid system
    estonian_grid = 39,
    /// Latvian Transverse Mercator
    latvian_grid = 40,
    /// Reference Grid 99 TM (Swedish)
    swedish_ref_99_grid = 41,
};

pub const Switch = enum(u8) {
    off = 0,
    on = 1,
    auto = 2,
};

pub const Sport = enum(u8) {
    generic = 0,
    running = 1,
    cycling = 2,
    /// Mulitsport transition
    transition = 3,
    fitness_equipment = 4,
    swimming = 5,
    basketball = 6,
    soccer = 7,
    tennis = 8,
    american_football = 9,
    training = 10,
    walking = 11,
    cross_country_skiing = 12,
    alpine_skiing = 13,
    snowboarding = 14,
    rowing = 15,
    mountaineering = 16,
    hiking = 17,
    multisport = 18,
    paddling = 19,
    flying = 20,
    e_biking = 21,
    motorcycling = 22,
    boating = 23,
    driving = 24,
    golf = 25,
    hang_gliding = 26,
    horseback_riding = 27,
    hunting = 28,
    fishing = 29,
    inline_skating = 30,
    rock_climbing = 31,
    sailing = 32,
    ice_skating = 33,
    sky_diving = 34,
    snowshoeing = 35,
    snowmobiling = 36,
    stand_up_paddleboarding = 37,
    surfing = 38,
    wakeboarding = 39,
    water_skiing = 40,
    kayaking = 41,
    rafting = 42,
    windsurfing = 43,
    kitesurfing = 44,
    tactical = 45,
    jumpmaster = 46,
    boxing = 47,
    floor_climbing = 48,
    baseball = 49,
    diving = 53,
    /// Sport Shooting bits, set here for sport_bits alignment
    shooting = 56,
    winter_sport = 58,
    /// Sailing position, operating manual winches to power boat controls
    grinding = 59,
    hiit = 62,
    video_gaming = 63,
    racket = 64,
    wheelchair_push_walk = 65,
    wheelchair_push_run = 66,
    meditation = 67,
    para_sport = 68,
    disc_golf = 69,
    team_sport = 70,
    cricket = 71,
    rugby = 72,
    hockey = 73,
    lacrosse = 74,
    volleyball = 75,
    water_tubing = 76,
    wakesurfing = 77,
    water_sport = 78,
    archery = 79,
    mixed_martial_arts = 80,
    motor_sports = 81,
    snorkeling = 82,
    dance = 83,
    jump_rope = 84,
    pool_apnea = 85,
    mobility = 86,
    geocaching = 87,
    canoeing = 88,
    /// All is for goals only to include all sports.
    all = 254,
};

/// Bit field corresponding to sport enum type (1 << sport).
pub const SportBits0 = enum(u8) {
    generic = 0x01,
    running = 0x02,
    cycling = 0x04,
    /// Mulitsport transition
    transition = 0x08,
    fitness_equipment = 0x10,
    swimming = 0x20,
    basketball = 0x40,
    soccer = 0x80,
};

/// Bit field corresponding to sport enum type (1 << (sport-8)).
pub const SportBits1 = enum(u8) {
    tennis = 0x01,
    american_football = 0x02,
    training = 0x04,
    walking = 0x08,
    cross_country_skiing = 0x10,
    alpine_skiing = 0x20,
    snowboarding = 0x40,
    rowing = 0x80,
};

/// Bit field corresponding to sport enum type (1 << (sport-16)).
pub const SportBits2 = enum(u8) {
    mountaineering = 0x01,
    hiking = 0x02,
    multisport = 0x04,
    paddling = 0x08,
    flying = 0x10,
    e_biking = 0x20,
    motorcycling = 0x40,
    boating = 0x80,
};

/// Bit field corresponding to sport enum type (1 << (sport-24)).
pub const SportBits3 = enum(u8) {
    driving = 0x01,
    golf = 0x02,
    hang_gliding = 0x04,
    horseback_riding = 0x08,
    hunting = 0x10,
    fishing = 0x20,
    inline_skating = 0x40,
    rock_climbing = 0x80,
};

/// Bit field corresponding to sport enum type (1 << (sport-32)).
pub const SportBits4 = enum(u8) {
    sailing = 0x01,
    ice_skating = 0x02,
    sky_diving = 0x04,
    snowshoeing = 0x08,
    snowmobiling = 0x10,
    stand_up_paddleboarding = 0x20,
    surfing = 0x40,
    wakeboarding = 0x80,
};

/// Bit field corresponding to sport enum type (1 << (sport-40)).
pub const SportBits5 = enum(u8) {
    water_skiing = 0x01,
    kayaking = 0x02,
    rafting = 0x04,
    windsurfing = 0x08,
    kitesurfing = 0x10,
    tactical = 0x20,
    jumpmaster = 0x40,
    boxing = 0x80,
};

/// Bit field corresponding to sport enum type (1 << (sport-48)).
pub const SportBits6 = enum(u8) {
    floor_climbing = 0x01,
};

pub const SubSport = enum(u8) {
    generic = 0,
    /// Run/Fitness Equipment
    treadmill = 1,
    /// Run
    street = 2,
    /// Run
    trail = 3,
    /// Run
    track = 4,
    /// Cycling
    spin = 5,
    /// Cycling/Fitness Equipment
    indoor_cycling = 6,
    /// Cycling
    road = 7,
    /// Cycling
    mountain = 8,
    /// Cycling
    downhill = 9,
    /// Cycling
    recumbent = 10,
    /// Cycling
    cyclocross = 11,
    /// Cycling
    hand_cycling = 12,
    /// Cycling
    track_cycling = 13,
    /// Fitness Equipment
    indoor_rowing = 14,
    /// Fitness Equipment
    elliptical = 15,
    /// Fitness Equipment
    stair_climbing = 16,
    /// Swimming
    lap_swimming = 17,
    /// Swimming
    open_water = 18,
    /// Training
    flexibility_training = 19,
    /// Training
    strength_training = 20,
    /// Tennis
    warm_up = 21,
    /// Tennis
    match = 22,
    /// Tennis
    exercise = 23,
    challenge = 24,
    /// Fitness Equipment
    indoor_skiing = 25,
    /// Training
    cardio_training = 26,
    /// Walking/Fitness Equipment
    indoor_walking = 27,
    /// E-Biking
    e_bike_fitness = 28,
    /// Cycling
    bmx = 29,
    /// Walking
    casual_walking = 30,
    /// Walking
    speed_walking = 31,
    /// Transition
    bike_to_run_transition = 32,
    /// Transition
    run_to_bike_transition = 33,
    /// Transition
    swim_to_bike_transition = 34,
    /// Motorcycling
    atv = 35,
    /// Motorcycling
    motocross = 36,
    /// Alpine Skiing/Snowboarding
    backcountry = 37,
    /// Alpine Skiing/Snowboarding
    resort = 38,
    /// Flying
    rc_drone = 39,
    /// Flying
    wingsuit = 40,
    /// Kayaking/Rafting
    whitewater = 41,
    /// Cross Country Skiing
    skate_skiing = 42,
    /// Training
    yoga = 43,
    /// Fitness Equipment
    pilates = 44,
    /// Run
    indoor_running = 45,
    /// Cycling
    gravel_cycling = 46,
    /// Cycling
    e_bike_mountain = 47,
    /// Cycling
    commuting = 48,
    /// Cycling
    mixed_surface = 49,
    navigate = 50,
    track_me = 51,
    map = 52,
    /// Diving
    single_gas_diving = 53,
    /// Diving
    multi_gas_diving = 54,
    /// Diving
    gauge_diving = 55,
    /// Diving
    apnea_diving = 56,
    /// Diving
    apnea_hunting = 57,
    virtual_activity = 58,
    /// Used for events where participants run, crawl through mud, climb over walls, etc.
    obstacle = 59,
    breathing = 62,
    /// Diving w/ closed circuit rebreather
    ccr_diving = 63,
    /// Sailing
    sail_race = 65,
    /// Generic
    expedition = 66,
    /// Ultramarathon
    ultra = 67,
    /// Climbing
    indoor_climbing = 68,
    /// Climbing
    bouldering = 69,
    /// High Intensity Interval Training
    hiit = 70,
    /// Sailing position, operating manual winches to power boat controls
    indoor_grinding = 71,
    /// Hunting
    hunting_with_dogs = 72,
    /// HIIT
    amrap = 73,
    /// HIIT
    emom = 74,
    /// HIIT
    tabata = 75,
    /// Video Gaming, Cycling, etc.
    esport = 77,
    /// Multisport
    triathlon = 78,
    /// Multisport
    duathlon = 79,
    /// Multisport
    brick = 80,
    /// Multisport
    swim_run = 81,
    /// Multisport
    adventure_race = 82,
    /// DEZL trucker workout training sport
    trucker_workout = 83,
    /// Racket
    pickleball = 84,
    /// Racket
    padel = 85,
    indoor_wheelchair_walk = 86,
    indoor_wheelchair_run = 87,
    indoor_hand_cycling = 88,
    /// Hockey
    field = 90,
    /// Hockey
    ice = 91,
    /// Disc
    ultimate = 92,
    /// Racket
    platform = 93,
    /// Racket
    squash = 94,
    /// Racket
    badminton = 95,
    /// Racket
    racquetball = 96,
    /// Racket
    table_tennis = 97,
    overland = 98,
    /// Generic
    trolling_motor = 99,
    /// Flying
    fly_canopy = 110,
    /// Flying
    fly_paraglide = 111,
    /// Flying
    fly_paramotor = 112,
    /// Flying
    fly_pressurized = 113,
    /// Flying
    fly_navigate = 114,
    /// Flying
    fly_timer = 115,
    /// Flying
    fly_altimeter = 116,
    /// Flying
    fly_wx = 117,
    /// Flying
    fly_vfr = 118,
    /// Flying
    fly_ifr = 119,
    dynamic_apnea = 121,
    /// Cycling
    enduro = 123,
    /// Hiking
    rucking = 124,
    /// Motor sports
    rally = 125,
    /// Multisport
    pool_triathlon = 126,
    /// Cycling
    e_bike_enduro = 127,
    all = 254,
};

pub const SportEvent = enum(u8) {
    uncategorized = 0,
    geocaching = 1,
    fitness = 2,
    recreation = 3,
    race = 4,
    special_event = 5,
    training = 6,
    transportation = 7,
    touring = 8,
};

pub const Activity = enum(u8) {
    manual = 0,
    auto_multi_sport = 1,
};

pub const Intensity = enum(u8) {
    active = 0,
    rest = 1,
    warmup = 2,
    cooldown = 3,
    recovery = 4,
    interval = 5,
    other = 6,
};

pub const SessionTrigger = enum(u8) {
    activity_end = 0,
    /// User changed sport.
    manual = 1,
    /// Auto multi-sport feature is enabled and user pressed lap button to advance session.
    auto_multi_sport = 2,
    /// Auto sport change caused by user linking to fitness equipment.
    fitness_equipment = 3,
};

pub const AutolapTrigger = enum(u8) {
    time = 0,
    distance = 1,
    position_start = 2,
    position_lap = 3,
    position_waypoint = 4,
    position_marked = 5,
    off = 6,
    auto_select = 13,
};

pub const LapTrigger = enum(u8) {
    manual = 0,
    time = 1,
    distance = 2,
    position_start = 3,
    position_lap = 4,
    position_waypoint = 5,
    position_marked = 6,
    session_end = 7,
    fitness_equipment = 8,
};

pub const TimeMode = enum(u8) {
    hour12 = 0,
    /// Does not use a leading zero and has a colon
    hour24 = 1,
    /// Uses a leading zero and does not have a colon
    military = 2,
    hour_12_with_seconds = 3,
    hour_24_with_seconds = 4,
    utc = 5,
};

pub const BacklightMode = enum(u8) {
    off = 0,
    manual = 1,
    key_and_messages = 2,
    auto_brightness = 3,
    smart_notifications = 4,
    key_and_messages_night = 5,
    key_and_messages_and_smart_notifications = 6,
};

pub const DateMode = enum(u8) {
    day_month = 0,
    month_day = 1,
};

/// Timeout in seconds.
pub const BacklightTimeout = enum(u8) {
    /// Backlight stays on forever.
    infinite = 0,
};

pub const Event = enum(u8) {
    /// Group 0. Start / stop_all
    timer = 0,
    /// start / stop
    workout = 3,
    /// Start at beginning of workout. Stop at end of each step.
    workout_step = 4,
    /// stop_all group 0
    power_down = 5,
    /// stop_all group 0
    power_up = 6,
    /// start / stop group 0
    off_course = 7,
    /// Stop at end of each session.
    session = 8,
    /// Stop at end of each lap.
    lap = 9,
    /// marker
    course_point = 10,
    /// marker
    battery = 11,
    /// Group 1. Start at beginning of activity if VP enabled, when VP pace is changed during activity or VP enabled mid activity. stop_disable when VP disabled.
    virtual_partner_pace = 12,
    /// Group 0. Start / stop when in alert condition.
    hr_high_alert = 13,
    /// Group 0. Start / stop when in alert condition.
    hr_low_alert = 14,
    /// Group 0. Start / stop when in alert condition.
    speed_high_alert = 15,
    /// Group 0. Start / stop when in alert condition.
    speed_low_alert = 16,
    /// Group 0. Start / stop when in alert condition.
    cad_high_alert = 17,
    /// Group 0. Start / stop when in alert condition.
    cad_low_alert = 18,
    /// Group 0. Start / stop when in alert condition.
    power_high_alert = 19,
    /// Group 0. Start / stop when in alert condition.
    power_low_alert = 20,
    /// marker
    recovery_hr = 21,
    /// marker
    battery_low = 22,
    /// Group 1. Start if enabled mid activity (not required at start of activity). Stop when duration is reached. stop_disable if disabled.
    time_duration_alert = 23,
    /// Group 1. Start if enabled mid activity (not required at start of activity). Stop when duration is reached. stop_disable if disabled.
    distance_duration_alert = 24,
    /// Group 1. Start if enabled mid activity (not required at start of activity). Stop when duration is reached. stop_disable if disabled.
    calorie_duration_alert = 25,
    /// Group 1.. Stop at end of activity.
    activity = 26,
    /// marker
    fitness_equipment = 27,
    /// Stop at end of each length.
    length = 28,
    /// marker
    user_marker = 32,
    /// marker
    sport_point = 33,
    /// start/stop/marker
    calibration = 36,
    /// marker
    front_gear_change = 42,
    /// marker
    rear_gear_change = 43,
    /// marker
    rider_position_change = 44,
    /// Group 0. Start / stop when in alert condition.
    elev_high_alert = 45,
    /// Group 0. Start / stop when in alert condition.
    elev_low_alert = 46,
    /// marker
    comm_timeout = 47,
    /// marker
    auto_activity_detect = 54,
    /// marker
    dive_alert = 56,
    /// marker
    dive_gas_switched = 57,
    /// marker
    tank_pressure_reserve = 71,
    /// marker
    tank_pressure_critical = 72,
    /// marker
    tank_lost = 73,
    /// start/stop/marker
    radar_threat_alert = 75,
    /// marker
    tank_battery_low = 76,
    /// marker - tank pod has connected
    tank_pod_connected = 81,
    /// marker - tank pod has lost connection
    tank_pod_disconnected = 82,
};

pub const EventType = enum(u8) {
    start = 0,
    stop = 1,
    consecutive_depreciated = 2,
    marker = 3,
    stop_all = 4,
    begin_depreciated = 5,
    end_depreciated = 6,
    end_all_depreciated = 7,
    stop_disable = 8,
    stop_disable_all = 9,
};

/// timer event data
pub const TimerTrigger = enum(u8) {
    manual = 0,
    auto = 1,
    fitness_equipment = 2,
};

/// fitness equipment event data
pub const FitnessEquipmentState = enum(u8) {
    ready = 0,
    in_use = 1,
    paused = 2,
    /// lost connection to fitness equipment
    unknown = 3,
};

pub const Tone = enum(u8) {
    off = 0,
    tone = 1,
    vibrate = 2,
    tone_and_vibrate = 3,
};

pub const Autoscroll = enum(u8) {
    none = 0,
    slow = 1,
    medium = 2,
    fast = 3,
};

pub const ActivityClass = enum(u8) {
    /// 0 to 100
    level = 0x7F,
    level_max = 100,
    athlete = 0x80,
};

pub const HrZoneCalc = enum(u8) {
    custom = 0,
    percent_max_hr = 1,
    percent_hrr = 2,
    percent_lthr = 3,
};

pub const PwrZoneCalc = enum(u8) {
    custom = 0,
    percent_ftp = 1,
};

pub const WktStepDuration = enum(u8) {
    time = 0,
    distance = 1,
    hr_less_than = 2,
    hr_greater_than = 3,
    calories = 4,
    open = 5,
    repeat_until_steps_cmplt = 6,
    repeat_until_time = 7,
    repeat_until_distance = 8,
    repeat_until_calories = 9,
    repeat_until_hr_less_than = 10,
    repeat_until_hr_greater_than = 11,
    repeat_until_power_less_than = 12,
    repeat_until_power_greater_than = 13,
    power_less_than = 14,
    power_greater_than = 15,
    training_peaks_tss = 16,
    repeat_until_power_last_lap_less_than = 17,
    repeat_until_max_power_last_lap_less_than = 18,
    power_3s_less_than = 19,
    power_10s_less_than = 20,
    power_30s_less_than = 21,
    power_3s_greater_than = 22,
    power_10s_greater_than = 23,
    power_30s_greater_than = 24,
    power_lap_less_than = 25,
    power_lap_greater_than = 26,
    repeat_until_training_peaks_tss = 27,
    repetition_time = 28,
    reps = 29,
    time_only = 31,
};

pub const WktStepTarget = enum(u8) {
    speed = 0,
    heart_rate = 1,
    open = 2,
    cadence = 3,
    power = 4,
    grade = 5,
    resistance = 6,
    power_3s = 7,
    power_10s = 8,
    power_30s = 9,
    power_lap = 10,
    swim_stroke = 11,
    speed_lap = 12,
    heart_rate_lap = 13,
};

pub const Goal = enum(u8) {
    time = 0,
    distance = 1,
    calories = 2,
    frequency = 3,
    steps = 4,
    ascent = 5,
    active_minutes = 6,
};

pub const GoalRecurrence = enum(u8) {
    off = 0,
    daily = 1,
    weekly = 2,
    monthly = 3,
    yearly = 4,
    custom = 5,
};

pub const GoalSource = enum(u8) {
    /// Device generated
    auto = 0,
    /// Social network sourced goal
    community = 1,
    /// Manually generated
    user = 2,
};

pub const Schedule = enum(u8) {
    workout = 0,
    course = 1,
};

pub const CoursePoint = enum(u8) {
    generic = 0,
    summit = 1,
    valley = 2,
    water = 3,
    food = 4,
    danger = 5,
    left = 6,
    right = 7,
    straight = 8,
    first_aid = 9,
    fourth_category = 10,
    third_category = 11,
    second_category = 12,
    first_category = 13,
    hors_category = 14,
    sprint = 15,
    left_fork = 16,
    right_fork = 17,
    middle_fork = 18,
    slight_left = 19,
    sharp_left = 20,
    slight_right = 21,
    sharp_right = 22,
    u_turn = 23,
    segment_start = 24,
    segment_end = 25,
    campsite = 27,
    aid_station = 28,
    rest_area = 29,
    /// Used with UpAhead
    general_distance = 30,
    service = 31,
    energy_gel = 32,
    sports_drink = 33,
    mile_marker = 34,
    checkpoint = 35,
    shelter = 36,
    meeting_spot = 37,
    overlook = 38,
    toilet = 39,
    shower = 40,
    gear = 41,
    sharp_curve = 42,
    steep_incline = 43,
    tunnel = 44,
    bridge = 45,
    obstacle = 46,
    crossing = 47,
    store = 48,
    transition = 49,
    navaid = 50,
    transport = 51,
    alert = 52,
    info = 53,
};

pub const Manufacturer = enum(u16) {
    garmin = 1,
    /// Do not use. Used by FR405 for ANTFS man id.
    garmin_fr405_antfs = 2,
    zephyr = 3,
    dayton = 4,
    idt = 5,
    srm = 6,
    quarq = 7,
    ibike = 8,
    saris = 9,
    spark_hk = 10,
    tanita = 11,
    echowell = 12,
    dynastream_oem = 13,
    nautilus = 14,
    dynastream = 15,
    timex = 16,
    metrigear = 17,
    xelic = 18,
    beurer = 19,
    cardiosport = 20,
    a_and_d = 21,
    hmm = 22,
    suunto = 23,
    thita_elektronik = 24,
    gpulse = 25,
    clean_mobile = 26,
    pedal_brain = 27,
    peaksware = 28,
    saxonar = 29,
    lemond_fitness = 30,
    dexcom = 31,
    wahoo_fitness = 32,
    octane_fitness = 33,
    archinoetics = 34,
    the_hurt_box = 35,
    citizen_systems = 36,
    magellan = 37,
    osynce = 38,
    holux = 39,
    concept2 = 40,
    shimano = 41,
    one_giant_leap = 42,
    ace_sensor = 43,
    brim_brothers = 44,
    xplova = 45,
    perception_digital = 46,
    bf1systems = 47,
    pioneer = 48,
    spantec = 49,
    metalogics = 50,
    _4iiiis = 51,
    seiko_epson = 52,
    seiko_epson_oem = 53,
    ifor_powell = 54,
    maxwell_guider = 55,
    star_trac = 56,
    breakaway = 57,
    alatech_technology_ltd = 58,
    mio_technology_europe = 59,
    rotor = 60,
    geonaute = 61,
    id_bike = 62,
    specialized = 63,
    wtek = 64,
    physical_enterprises = 65,
    north_pole_engineering = 66,
    bkool = 67,
    cateye = 68,
    stages_cycling = 69,
    sigmasport = 70,
    tomtom = 71,
    peripedal = 72,
    wattbike = 73,
    moxy = 76,
    ciclosport = 77,
    powerbahn = 78,
    acorn_projects_aps = 79,
    lifebeam = 80,
    bontrager = 81,
    wellgo = 82,
    scosche = 83,
    magura = 84,
    woodway = 85,
    elite = 86,
    nielsen_kellerman = 87,
    dk_city = 88,
    tacx = 89,
    direction_technology = 90,
    magtonic = 91,
    _1partcarbon = 92,
    inside_ride_technologies = 93,
    sound_of_motion = 94,
    stryd = 95,
    /// Indoorcycling Group
    icg = 96,
    MiPulse = 97,
    bsx_athletics = 98,
    look = 99,
    campagnolo_srl = 100,
    body_bike_smart = 101,
    praxisworks = 102,
    /// Limits Technology Ltd.
    limits_technology = 103,
    /// TopAction Technology Inc.
    topaction_technology = 104,
    cosinuss = 105,
    fitcare = 106,
    magene = 107,
    giant_manufacturing_co = 108,
    /// Tigrasport
    tigrasport = 109,
    salutron = 110,
    technogym = 111,
    bryton_sensors = 112,
    latitude_limited = 113,
    soaring_technology = 114,
    igpsport = 115,
    thinkrider = 116,
    gopher_sport = 117,
    waterrower = 118,
    orangetheory = 119,
    inpeak = 120,
    kinetic = 121,
    johnson_health_tech = 122,
    polar_electro = 123,
    seesense = 124,
    nci_technology = 125,
    iqsquare = 126,
    leomo = 127,
    ifit_com = 128,
    coros_byte = 129,
    versa_design = 130,
    chileaf = 131,
    cycplus = 132,
    gravaa_byte = 133,
    sigeyi = 134,
    coospo = 135,
    geoid = 136,
    bosch = 137,
    kyto = 138,
    kinetic_sports = 139,
    decathlon_byte = 140,
    tq_systems = 141,
    tag_heuer = 142,
    keiser_fitness = 143,
    zwift_byte = 144,
    porsche_ep = 145,
    blackbird = 146,
    meilan_byte = 147,
    ezon = 148,
    laisi = 149,
    myzone = 150,
    abawo = 151,
    bafang = 152,
    luhong_technology = 153,
    development = 255,
    healthandlife = 257,
    lezyne = 258,
    scribe_labs = 259,
    zwift = 260,
    watteam = 261,
    recon = 262,
    favero_electronics = 263,
    dynovelo = 264,
    strava = 265,
    /// Amer Sports
    precor = 266,
    bryton = 267,
    sram = 268,
    /// MiTAC Global Corporation (Mio Technology)
    navman = 269,
    /// COBI GmbH
    cobi = 270,
    spivi = 271,
    mio_magellan = 272,
    evesports = 273,
    sensitivus_gauge = 274,
    podoon = 275,
    life_time_fitness = 276,
    /// Falco eMotors Inc.
    falco_e_motors = 277,
    minoura = 278,
    cycliq = 279,
    luxottica = 280,
    trainer_road = 281,
    the_sufferfest = 282,
    fullspeedahead = 283,
    virtualtraining = 284,
    feedbacksports = 285,
    omata = 286,
    vdo = 287,
    magneticdays = 288,
    hammerhead = 289,
    kinetic_by_kurt = 290,
    shapelog = 291,
    dabuziduo = 292,
    jetblack = 293,
    coros = 294,
    virtugo = 295,
    velosense = 296,
    cycligentinc = 297,
    trailforks = 298,
    mahle_ebikemotion = 299,
    nurvv = 300,
    microprogram = 301,
    zone5cloud = 302,
    greenteg = 303,
    yamaha_motors = 304,
    whoop = 305,
    gravaa = 306,
    onelap = 307,
    monark_exercise = 308,
    form = 309,
    decathlon = 310,
    syncros = 311,
    heatup = 312,
    cannondale = 313,
    true_fitness = 314,
    RGT_cycling = 315,
    vasa = 316,
    race_republic = 317,
    fazua = 318,
    oreka_training = 319,
    /// Lishun Electric & Communication
    lsec = 320,
    lululemon_studio = 321,
    shanyue = 322,
    spinning_mda = 323,
    hilldating = 324,
    aero_sensor = 325,
    nike = 326,
    magicshine = 327,
    ictrainer = 328,
    absolute_cycling = 329,
    eo_swimbetter = 330,
    mywhoosh = 331,
    ravemen = 332,
    tektro_racing_products = 333,
    darad_innovation_corporation = 334,
    cycloptim = 335,
    runna = 337,
    zepp = 339,
    peloton = 340,
    carv = 341,
    tissot = 342,
    real_velo = 345,
    wetech = 346,
    jespr = 347,
    huawei = 348,
    gotoes = 349,
    cadence_app = 350,
    actigraphcorp = 5759,
};

pub const GarminProduct = enum(u16) {
    hrm1 = 1,
    /// AXH01 HRM chipset
    axh01 = 2,
    axb01 = 3,
    axb02 = 4,
    hrm2ss = 5,
    dsi_alf02 = 6,
    hrm3ss = 7,
    /// hrm_run model for HRM ANT+ messaging
    hrm_run_single_byte_product_id = 8,
    /// BSM model for ANT+ messaging
    bsm = 9,
    /// BCM model for ANT+ messaging
    bcm = 10,
    /// AXS01 HRM Bike Chipset model for ANT+ messaging
    axs01 = 11,
    /// hrm_tri model for HRM ANT+ messaging
    hrm_tri_single_byte_product_id = 12,
    /// hrm4 run model for HRM ANT+ messaging
    hrm4_run_single_byte_product_id = 13,
    /// fr225 model for HRM ANT+ messaging
    fr225_single_byte_product_id = 14,
    /// gen3_bsm model for Bike Speed ANT+ messaging
    gen3_bsm_single_byte_product_id = 15,
    /// gen3_bcm model for Bike Cadence ANT+ messaging
    gen3_bcm_single_byte_product_id = 16,
    hrm_fit_single_byte_product_id = 22,
    /// Garmin Wearable Optical Heart Rate Sensor for ANT+ HR Profile Broadcasting
    OHR = 255,
    fr301_china = 473,
    fr301_japan = 474,
    fr301_korea = 475,
    fr301_taiwan = 494,
    /// Forerunner 405
    fr405 = 717,
    /// Forerunner 50
    fr50 = 782,
    fr405_japan = 987,
    /// Forerunner 60
    fr60 = 988,
    dsi_alf01 = 1011,
    /// Forerunner 310
    fr310xt = 1018,
    edge500 = 1036,
    /// Forerunner 110
    fr110 = 1124,
    edge800 = 1169,
    edge500_taiwan = 1199,
    edge500_japan = 1213,
    chirp = 1253,
    fr110_japan = 1274,
    edge200 = 1325,
    fr910xt = 1328,
    edge800_taiwan = 1333,
    edge800_japan = 1334,
    alf04 = 1341,
    fr610 = 1345,
    fr210_japan = 1360,
    vector_ss = 1380,
    vector_cp = 1381,
    edge800_china = 1386,
    edge500_china = 1387,
    approach_g10 = 1405,
    fr610_japan = 1410,
    edge500_korea = 1422,
    fr70 = 1436,
    fr310xt_4t = 1446,
    amx = 1461,
    fr10 = 1482,
    edge800_korea = 1497,
    swim = 1499,
    fr910xt_china = 1537,
    fenix = 1551,
    edge200_taiwan = 1555,
    edge510 = 1561,
    edge810 = 1567,
    tempe = 1570,
    fr910xt_japan = 1600,
    fr620 = 1623,
    fr220 = 1632,
    fr910xt_korea = 1664,
    fr10_japan = 1688,
    edge810_japan = 1721,
    virb_elite = 1735,
    /// Also Edge Touring Plus
    edge_touring = 1736,
    edge510_japan = 1742,
    /// Also HRM-Swim
    hrm_tri = 1743,
    hrm_run = 1752,
    fr920xt = 1765,
    edge510_asia = 1821,
    edge810_china = 1822,
    edge810_taiwan = 1823,
    edge1000 = 1836,
    vivo_fit = 1837,
    virb_remote = 1853,
    vivo_ki = 1885,
    fr15 = 1903,
    vivo_active = 1907,
    edge510_korea = 1918,
    fr620_japan = 1928,
    fr620_china = 1929,
    fr220_japan = 1930,
    fr220_china = 1931,
    approach_s6 = 1936,
    vivo_smart = 1956,
    fenix2 = 1967,
    epix = 1988,
    fenix3 = 2050,
    edge1000_taiwan = 2052,
    edge1000_japan = 2053,
    fr15_japan = 2061,
    edge520 = 2067,
    edge1000_china = 2070,
    fr620_russia = 2072,
    fr220_russia = 2073,
    vector_s = 2079,
    edge1000_korea = 2100,
    fr920xt_taiwan = 2130,
    fr920xt_china = 2131,
    fr920xt_japan = 2132,
    virbx = 2134,
    vivo_smart_apac = 2135,
    etrex_touch = 2140,
    edge25 = 2147,
    fr25 = 2148,
    vivo_fit2 = 2150,
    fr225 = 2153,
    fr630 = 2156,
    fr230 = 2157,
    fr735xt = 2158,
    vivo_active_apac = 2160,
    vector_2 = 2161,
    vector_2s = 2162,
    virbxe = 2172,
    fr620_taiwan = 2173,
    fr220_taiwan = 2174,
    truswing = 2175,
    d2airvenu = 2187,
    fenix3_china = 2188,
    fenix3_twn = 2189,
    varia_headlight = 2192,
    varia_taillight_old = 2193,
    edge_explore_1000 = 2204,
    fr225_asia = 2219,
    varia_radar_taillight = 2225,
    varia_radar_display = 2226,
    edge20 = 2238,
    edge520_asia = 2260,
    edge520_japan = 2261,
    d2_bravo = 2262,
    approach_s20 = 2266,
    vivo_smart2 = 2271,
    edge1000_thai = 2274,
    varia_remote = 2276,
    edge25_asia = 2288,
    edge25_jpn = 2289,
    edge20_asia = 2290,
    approach_x40 = 2292,
    fenix3_japan = 2293,
    vivo_smart_emea = 2294,
    fr630_asia = 2310,
    fr630_jpn = 2311,
    fr230_jpn = 2313,
    hrm4_run = 2327,
    epix_japan = 2332,
    vivo_active_hr = 2337,
    vivo_smart_gps_hr = 2347,
    vivo_smart_hr = 2348,
    vivo_smart_hr_asia = 2361,
    vivo_smart_gps_hr_asia = 2362,
    vivo_move = 2368,
    varia_taillight = 2379,
    fr235_asia = 2396,
    fr235_japan = 2397,
    varia_vision = 2398,
    vivo_fit3 = 2406,
    fenix3_korea = 2407,
    fenix3_sea = 2408,
    fenix3_hr = 2413,
    virb_ultra_30 = 2417,
    index_smart_scale = 2429,
    fr235 = 2431,
    fenix3_chronos = 2432,
    oregon7xx = 2441,
    rino7xx = 2444,
    epix_korea = 2457,
    fenix3_hr_chn = 2473,
    fenix3_hr_twn = 2474,
    fenix3_hr_jpn = 2475,
    fenix3_hr_sea = 2476,
    fenix3_hr_kor = 2477,
    nautix = 2496,
    vivo_active_hr_apac = 2497,
    fr35 = 2503,
    oregon7xx_ww = 2512,
    edge_820 = 2530,
    edge_explore_820 = 2531,
    fr735xt_apac = 2533,
    fr735xt_japan = 2534,
    fenix5s = 2544,
    d2_bravo_titanium = 2547,
    /// Varia UT 800 SW
    varia_ut800 = 2567,
    running_dynamics_pod = 2593,
    edge_820_china = 2599,
    edge_820_japan = 2600,
    fenix5x = 2604,
    vivo_fit_jr = 2606,
    vivo_smart3 = 2622,
    vivo_sport = 2623,
    edge_820_taiwan = 2628,
    edge_820_korea = 2629,
    edge_820_sea = 2630,
    fr35_hebrew = 2650,
    approach_s60 = 2656,
    fr35_apac = 2667,
    fr35_japan = 2668,
    fenix3_chronos_asia = 2675,
    virb_360 = 2687,
    fr935 = 2691,
    fenix5 = 2697,
    vivoactive3 = 2700,
    fr235_china_nfc = 2733,
    foretrex_601_701 = 2769,
    vivo_move_hr = 2772,
    edge_1030 = 2713,
    fr35_sea = 2727,
    vector_3 = 2787,
    fenix5_asia = 2796,
    fenix5s_asia = 2797,
    fenix5x_asia = 2798,
    approach_z80 = 2806,
    fr35_korea = 2814,
    d2charlie = 2819,
    vivo_smart3_apac = 2831,
    vivo_sport_apac = 2832,
    fr935_asia = 2833,
    descent = 2859,
    vivo_fit4 = 2878,
    fr645 = 2886,
    fr645m = 2888,
    fr30 = 2891,
    fenix5s_plus = 2900,
    Edge_130 = 2909,
    edge_1030_asia = 2924,
    vivosmart_4 = 2927,
    vivo_move_hr_asia = 2945,
    approach_x10 = 2962,
    fr30_asia = 2977,
    vivoactive3m_w = 2988,
    fr645_asia = 3003,
    fr645m_asia = 3004,
    edge_explore = 3011,
    gpsmap66 = 3028,
    approach_s10 = 3049,
    vivoactive3m_l = 3066,
    fr245 = 3076,
    fr245_music = 3077,
    approach_g80 = 3085,
    edge_130_asia = 3092,
    edge_1030_bontrager = 3095,
    fenix5_plus = 3110,
    fenix5x_plus = 3111,
    edge_520_plus = 3112,
    fr945 = 3113,
    edge_530 = 3121,
    edge_830 = 3122,
    instinct_esports = 3126,
    fenix5s_plus_apac = 3134,
    fenix5x_plus_apac = 3135,
    edge_520_plus_apac = 3142,
    descent_t1 = 3143,
    fr235l_asia = 3144,
    fr245_asia = 3145,
    vivo_active3m_apac = 3163,
    /// gen3 bike speed sensor
    gen3_bsm = 3192,
    /// gen3 bike cadence sensor
    gen3_bcm = 3193,
    vivo_smart4_asia = 3218,
    vivoactive4_small = 3224,
    vivoactive4_large = 3225,
    venu = 3226,
    marq_driver = 3246,
    marq_aviator = 3247,
    marq_captain = 3248,
    marq_commander = 3249,
    marq_expedition = 3250,
    marq_athlete = 3251,
    descent_mk2 = 3258,
    fr45 = 3282,
    gpsmap66i = 3284,
    fenix6S_sport = 3287,
    fenix6S = 3288,
    fenix6_sport = 3289,
    fenix6 = 3290,
    fenix6x = 3291,
    /// HRM-Dual
    hrm_dual = 3299,
    /// HRM-Pro
    hrm_pro = 3300,
    vivo_move3_premium = 3308,
    approach_s40 = 3314,
    fr245m_asia = 3321,
    edge_530_apac = 3349,
    edge_830_apac = 3350,
    vivo_move3 = 3378,
    vivo_active4_small_asia = 3387,
    vivo_active4_large_asia = 3388,
    vivo_active4_oled_asia = 3389,
    swim2 = 3405,
    marq_driver_asia = 3420,
    marq_aviator_asia = 3421,
    vivo_move3_asia = 3422,
    fr945_asia = 3441,
    vivo_active3t_chn = 3446,
    marq_captain_asia = 3448,
    marq_commander_asia = 3449,
    marq_expedition_asia = 3450,
    marq_athlete_asia = 3451,
    index_smart_scale_2 = 3461,
    instinct_solar = 3466,
    fr45_asia = 3469,
    vivoactive3_daimler = 3473,
    legacy_rey = 3498,
    legacy_darth_vader = 3499,
    legacy_captain_marvel = 3500,
    legacy_first_avenger = 3501,
    fenix6s_sport_asia = 3512,
    fenix6s_asia = 3513,
    fenix6_sport_asia = 3514,
    fenix6_asia = 3515,
    fenix6x_asia = 3516,
    legacy_captain_marvel_asia = 3535,
    legacy_first_avenger_asia = 3536,
    legacy_rey_asia = 3537,
    legacy_darth_vader_asia = 3538,
    descent_mk2s = 3542,
    edge_130_plus = 3558,
    edge_1030_plus = 3570,
    /// Rally 100/200 Power Meter Series
    rally_200 = 3578,
    fr745 = 3589,
    venusq_music = 3596,
    venusq_music_v2 = 3599,
    venusq = 3600,
    lily = 3615,
    marq_adventurer = 3624,
    enduro = 3638,
    swim2_apac = 3639,
    marq_adventurer_asia = 3648,
    fr945_lte = 3652,
    /// Mk2 and Mk2i
    descent_mk2_asia = 3702,
    venu2 = 3703,
    venu2s = 3704,
    venu_daimler_asia = 3737,
    marq_golfer = 3739,
    venu_daimler = 3740,
    fr745_asia = 3794,
    varia_rct715 = 3808,
    lily_asia = 3809,
    edge_1030_plus_asia = 3812,
    edge_130_plus_asia = 3813,
    approach_s12 = 3823,
    enduro_asia = 3872,
    venusq_asia = 3837,
    edge_1040 = 3843,
    marq_golfer_asia = 3850,
    venu2_plus = 3851,
    /// Airoha AG3335M Family
    gnss = 3865,
    fr55 = 3869,
    instinct_2 = 3888,
    instinct_2s = 3889,
    fenix7s = 3905,
    fenix7 = 3906,
    fenix7x = 3907,
    fenix7s_apac = 3908,
    fenix7_apac = 3909,
    fenix7x_apac = 3910,
    approach_g12 = 3927,
    descent_mk2s_asia = 3930,
    approach_s42 = 3934,
    epix_gen2 = 3943,
    epix_gen2_apac = 3944,
    venu2s_asia = 3949,
    venu2_asia = 3950,
    fr945_lte_asia = 3978,
    vivo_move_sport = 3982,
    vivomove_trend = 3983,
    approach_S12_asia = 3986,
    fr255_music = 3990,
    fr255_small_music = 3991,
    fr255 = 3992,
    fr255_small = 3993,
    approach_g12_asia = 4001,
    approach_s42_asia = 4002,
    descent_g1 = 4005,
    venu2_plus_asia = 4017,
    fr955 = 4024,
    fr55_asia = 4033,
    edge_540 = 4061,
    edge_840 = 4062,
    vivosmart_5 = 4063,
    instinct_2_asia = 4071,
    /// Adventurer, Athlete, Captain, Golfer
    marq_gen2 = 4105,
    venusq2 = 4115,
    venusq2music = 4116,
    marq_gen2_aviator = 4124,
    d2_air_x10 = 4125,
    hrm_pro_plus = 4130,
    descent_g1_asia = 4132,
    tactix7 = 4135,
    instinct_crossover = 4155,
    edge_explore2 = 4169,
    descent_mk3 = 4222,
    descent_mk3i = 4223,
    approach_s70 = 4233,
    fr265_large = 4257,
    fr265_small = 4258,
    venu3 = 4260,
    venu3s = 4261,
    /// Neo Smart, Tacx
    tacx_neo_smart = 4265,
    /// Neo 2 Smart, Tacx
    tacx_neo2_smart = 4266,
    /// Neo 2T Smart, Tacx
    tacx_neo2_t_smart = 4267,
    /// Neo Smart Bike, Tacx
    tacx_neo_smart_bike = 4268,
    /// Satori Smart, Tacx
    tacx_satori_smart = 4269,
    /// Flow Smart, Tacx
    tacx_flow_smart = 4270,
    /// Vortex Smart, Tacx
    tacx_vortex_smart = 4271,
    /// Bushido Smart, Tacx
    tacx_bushido_smart = 4272,
    /// Genius Smart, Tacx
    tacx_genius_smart = 4273,
    /// Flux/Flux S Smart, Tacx
    tacx_flux_flux_s_smart = 4274,
    /// Flux 2 Smart, Tacx
    tacx_flux2_smart = 4275,
    /// Magnum, Tacx
    tacx_magnum = 4276,
    edge_1040_asia = 4305,
    epix_gen2_pro_42 = 4312,
    epix_gen2_pro_47 = 4313,
    epix_gen2_pro_51 = 4314,
    fr965 = 4315,
    enduro2 = 4341,
    fenix7s_pro_solar = 4374,
    fenix7_pro_solar = 4375,
    fenix7x_pro_solar = 4376,
    lily2 = 4380,
    instinct_2x = 4394,
    vivoactive5 = 4426,
    fr165 = 4432,
    fr165_music = 4433,
    edge_1050 = 4440,
    descent_t2 = 4442,
    hrm_fit = 4446,
    marq_gen2_commander = 4472,
    /// aka the Lily 2 Active
    lily_athlete = 4477,
    /// Rally 110/210
    rally_x10 = 4525,
    fenix8_solar = 4532,
    fenix8_solar_large = 4533,
    fenix8_small = 4534,
    fenix8 = 4536,
    d2_mach1_pro = 4556,
    enduro3 = 4575,
    instinctE_40mm = 4583,
    instinctE_45mm = 4584,
    instinct3_solar_45mm = 4585,
    instinct3_amoled_45mm = 4586,
    instinct3_amoled_50mm = 4587,
    descent_g2 = 4588,
    venu_x1 = 4603,
    hrm_200 = 4606,
    vivoactive6 = 4625,
    fenix8_pro = 4631,
    edge_550 = 4633,
    edge_850 = 4634,
    venu4 = 4643,
    venu4s = 4644,
    approachS44 = 4647,
    edge_mtb = 4655,
    approachS50 = 4656,
    fenix_e = 4666,
    bounce2 = 4745,
    instinct3_solar_50mm = 4759,
    tactix8_amoled = 4775,
    tactix8_solar = 4776,
    fr170_music = 4814,
    fr170 = 4815,
    approach_j1 = 4825,
    d2_mach2 = 4879,
    fr70_2026 = 4916,
    instinct_crossover_amoled = 4678,
    d2_air_x15 = 4944,
    d2_mach2_pro = 5056,
    /// SDM4 footpod
    sdm4 = 10007,
    edge_remote = 10014,
    tacx_training_app_win = 20533,
    tacx_training_app_mac = 20534,
    tacx_training_app_mac_catalyst = 20565,
    training_center = 20119,
    tacx_training_app_android = 30045,
    tacx_training_app_ios = 30046,
    tacx_training_app_legacy = 30047,
    connectiq_simulator = 65531,
    android_antplus_plugin = 65532,
    /// Garmin Connect website
    connect = 65534,
};

pub const AntplusDeviceType = enum(u8) {
    antfs = 1,
    bike_power = 11,
    environment_sensor_legacy = 12,
    multi_sport_speed_distance = 15,
    control = 16,
    fitness_equipment = 17,
    blood_pressure = 18,
    geocache_node = 19,
    light_electric_vehicle = 20,
    env_sensor = 25,
    racquet = 26,
    control_hub = 27,
    muscle_oxygen = 31,
    shifting = 34,
    bike_light_main = 35,
    bike_light_shared = 36,
    exd = 38,
    bike_radar = 40,
    bike_aero = 46,
    weight_scale = 119,
    heart_rate = 120,
    bike_speed_cadence = 121,
    bike_cadence = 122,
    bike_speed = 123,
    stride_speed_distance = 124,
};

pub const AntNetwork = enum(u8) {
    public = 0,
    antplus = 1,
    antfs = 2,
    private = 3,
};

pub const WorkoutCapabilities = enum(u32) {
    interval = 0x00000001,
    custom = 0x00000002,
    fitness_equipment = 0x00000004,
    firstbeat = 0x00000008,
    new_leaf = 0x00000010,
    /// For backwards compatibility. Watch should add missing id fields then clear flag.
    tcx = 0x00000020,
    /// Speed source required for workout step.
    speed = 0x00000080,
    /// Heart rate source required for workout step.
    heart_rate = 0x00000100,
    /// Distance source required for workout step.
    distance = 0x00000200,
    /// Cadence source required for workout step.
    cadence = 0x00000400,
    /// Power source required for workout step.
    power = 0x00000800,
    /// Grade source required for workout step.
    grade = 0x00001000,
    /// Resistance source required for workout step.
    resistance = 0x00002000,
    protected = 0x00004000,
};

pub const BatteryStatus = enum(u8) {
    new = 1,
    good = 2,
    ok = 3,
    low = 4,
    critical = 5,
    charging = 6,
    unknown = 7,
};

pub const HrType = enum(u8) {
    normal = 0,
    irregular = 1,
};

pub const CourseCapabilities = enum(u32) {
    processed = 0x00000001,
    valid = 0x00000002,
    time = 0x00000004,
    distance = 0x00000008,
    position = 0x00000010,
    heart_rate = 0x00000020,
    power = 0x00000040,
    cadence = 0x00000080,
    training = 0x00000100,
    navigation = 0x00000200,
    bikeway = 0x00000400,
    /// Denote course files to be used as flight plans
    aviation = 0x00001000,
};

pub const Weight = enum(u16) {
    calculating = 0xFFFE,
};

/// 0 - 100 indicates% of max hr; >100 indicates bpm (255 max) plus 100
pub const WorkoutHr = enum(u32) {
    bpm_offset = 100,
};

/// 0 - 1000 indicates % of functional threshold power; >1000 indicates watts plus 1000.
pub const WorkoutPower = enum(u32) {
    watts_offset = 1000,
};

pub const BpStatus = enum(u8) {
    no_error = 0,
    error_incomplete_data = 1,
    error_no_measurement = 2,
    error_data_out_of_range = 3,
    error_irregular_heart_rate = 4,
};

pub const UserLocalId = enum(u16) {
    local_min = 0x0000,
    local_max = 0x000F,
    stationary_min = 0x0010,
    stationary_max = 0x00FF,
    portable_min = 0x0100,
    portable_max = 0xFFFE,
};

pub const SwimStroke = enum(u8) {
    freestyle = 0,
    backstroke = 1,
    breaststroke = 2,
    butterfly = 3,
    drill = 4,
    mixed = 5,
    /// IM is a mixed interval containing the same number of lengths for each of: Butterfly, Backstroke, Breaststroke, Freestyle, swam in that order.
    im = 6,
    /// For repeated workout steps, a new individual medly stroke is used for each round.
    im_by_round = 7,
    /// Reverse IM Order
    rimo = 8,
};

pub const ActivityType = enum(u8) {
    generic = 0,
    running = 1,
    cycling = 2,
    /// Mulitsport transition
    transition = 3,
    fitness_equipment = 4,
    swimming = 5,
    walking = 6,
    sedentary = 8,
    /// All is for goals only to include all sports.
    all = 254,
};

pub const ActivitySubtype = enum(u8) {
    generic = 0,
    /// Run
    treadmill = 1,
    /// Run
    street = 2,
    /// Run
    trail = 3,
    /// Run
    track = 4,
    /// Cycling
    spin = 5,
    /// Cycling
    indoor_cycling = 6,
    /// Cycling
    road = 7,
    /// Cycling
    mountain = 8,
    /// Cycling
    downhill = 9,
    /// Cycling
    recumbent = 10,
    /// Cycling
    cyclocross = 11,
    /// Cycling
    hand_cycling = 12,
    /// Cycling
    track_cycling = 13,
    /// Fitness Equipment
    indoor_rowing = 14,
    /// Fitness Equipment
    elliptical = 15,
    /// Fitness Equipment
    stair_climbing = 16,
    /// Swimming
    lap_swimming = 17,
    /// Swimming
    open_water = 18,
    all = 254,
};

pub const ActivityLevel = enum(u8) {
    low = 0,
    medium = 1,
    high = 2,
};

pub const Side = enum(u8) {
    right = 0,
    left = 1,
};

pub const LeftRightBalance = enum(u8) {
    /// % contribution
    mask = 0x7F,
    /// data corresponds to right if set, otherwise unknown
    right = 0x80,
};

pub const LeftRightBalance100 = enum(u16) {
    /// % contribution scaled by 100
    mask = 0x3FFF,
    /// data corresponds to right if set, otherwise unknown
    right = 0x8000,
};

pub const LengthType = enum(u8) {
    /// Rest period. Length with no strokes
    idle = 0,
    /// Length with strokes.
    active = 1,
};

pub const DayOfWeek = enum(u8) {
    sunday = 0,
    monday = 1,
    tuesday = 2,
    wednesday = 3,
    thursday = 4,
    friday = 5,
    saturday = 6,
};

pub const ConnectivityCapabilities = enum(u32) {
    bluetooth = 0x00000001,
    bluetooth_le = 0x00000002,
    ant = 0x00000004,
    activity_upload = 0x00000008,
    course_download = 0x00000010,
    workout_download = 0x00000020,
    live_track = 0x00000040,
    weather_conditions = 0x00000080,
    weather_alerts = 0x00000100,
    gps_ephemeris_download = 0x00000200,
    explicit_archive = 0x00000400,
    setup_incomplete = 0x00000800,
    continue_sync_after_software_update = 0x00001000,
    connect_iq_app_download = 0x00002000,
    golf_course_download = 0x00004000,
    /// Indicates device is in control of initiating all syncs
    device_initiates_sync = 0x00008000,
    connect_iq_watch_app_download = 0x00010000,
    connect_iq_widget_download = 0x00020000,
    connect_iq_watch_face_download = 0x00040000,
    connect_iq_data_field_download = 0x00080000,
    /// Device supports delete and reorder of apps via GCM
    connect_iq_app_managment = 0x00100000,
    swing_sensor = 0x00200000,
    swing_sensor_remote = 0x00400000,
    /// Device supports incident detection
    incident_detection = 0x00800000,
    audio_prompts = 0x01000000,
    /// Device supports reporting wifi verification via GCM
    wifi_verification = 0x02000000,
    /// Device supports True Up
    true_up = 0x04000000,
    /// Device supports Find My Watch
    find_my_watch = 0x08000000,
    remote_manual_sync = 0x10000000,
    /// Device supports LiveTrack auto start
    live_track_auto_start = 0x20000000,
    /// Device supports LiveTrack Messaging
    live_track_messaging = 0x40000000,
    /// Device supports instant input feature
    instant_input = 0x80000000,
};

pub const WeatherReport = enum(u8) {
    current = 0,
    /// Deprecated use hourly_forecast instead
    forecast = 1,
    hourly_forecast = 1,
    daily_forecast = 2,
};

pub const WeatherStatus = enum(u8) {
    clear = 0,
    partly_cloudy = 1,
    mostly_cloudy = 2,
    rain = 3,
    snow = 4,
    windy = 5,
    thunderstorms = 6,
    wintry_mix = 7,
    fog = 8,
    hazy = 11,
    hail = 12,
    scattered_showers = 13,
    scattered_thunderstorms = 14,
    unknown_precipitation = 15,
    light_rain = 16,
    heavy_rain = 17,
    light_snow = 18,
    heavy_snow = 19,
    light_rain_snow = 20,
    heavy_rain_snow = 21,
    cloudy = 22,
};

pub const WeatherSeverity = enum(u8) {
    unknown = 0,
    warning = 1,
    watch = 2,
    advisory = 3,
    statement = 4,
};

pub const WeatherSevereType = enum(u8) {
    unspecified = 0,
    tornado = 1,
    tsunami = 2,
    hurricane = 3,
    extreme_wind = 4,
    typhoon = 5,
    inland_hurricane = 6,
    hurricane_force_wind = 7,
    waterspout = 8,
    severe_thunderstorm = 9,
    wreckhouse_winds = 10,
    les_suetes_wind = 11,
    avalanche = 12,
    flash_flood = 13,
    tropical_storm = 14,
    inland_tropical_storm = 15,
    blizzard = 16,
    ice_storm = 17,
    freezing_rain = 18,
    debris_flow = 19,
    flash_freeze = 20,
    dust_storm = 21,
    high_wind = 22,
    winter_storm = 23,
    heavy_freezing_spray = 24,
    extreme_cold = 25,
    wind_chill = 26,
    cold_wave = 27,
    heavy_snow_alert = 28,
    lake_effect_blowing_snow = 29,
    snow_squall = 30,
    lake_effect_snow = 31,
    winter_weather = 32,
    sleet = 33,
    snowfall = 34,
    snow_and_blowing_snow = 35,
    blowing_snow = 36,
    snow_alert = 37,
    arctic_outflow = 38,
    freezing_drizzle = 39,
    storm = 40,
    storm_surge = 41,
    rainfall = 42,
    areal_flood = 43,
    coastal_flood = 44,
    lakeshore_flood = 45,
    excessive_heat = 46,
    heat = 47,
    weather = 48,
    high_heat_and_humidity = 49,
    humidex_and_health = 50,
    humidex = 51,
    gale = 52,
    freezing_spray = 53,
    special_marine = 54,
    squall = 55,
    strong_wind = 56,
    lake_wind = 57,
    marine_weather = 58,
    wind = 59,
    small_craft_hazardous_seas = 60,
    hazardous_seas = 61,
    small_craft = 62,
    small_craft_winds = 63,
    small_craft_rough_bar = 64,
    high_water_level = 65,
    ashfall = 66,
    freezing_fog = 67,
    dense_fog = 68,
    dense_smoke = 69,
    blowing_dust = 70,
    hard_freeze = 71,
    freeze = 72,
    frost = 73,
    fire_weather = 74,
    flood = 75,
    rip_tide = 76,
    high_surf = 77,
    smog = 78,
    air_quality = 79,
    brisk_wind = 80,
    air_stagnation = 81,
    low_water = 82,
    hydrological = 83,
    special_weather = 84,
};

/// number of seconds into the day since 00:00:00 UTC
pub const TimeIntoDay = enum(u32) {};

/// number of seconds into the day since local 00:00:00
pub const LocaltimeIntoDay = enum(u32) {};

pub const StrokeType = enum(u8) {
    no_event = 0,
    /// stroke was detected but cannot be identified
    other = 1,
    serve = 2,
    forehand = 3,
    backhand = 4,
    smash = 5,
};

pub const BodyLocation = enum(u8) {
    left_leg = 0,
    left_calf = 1,
    left_shin = 2,
    left_hamstring = 3,
    left_quad = 4,
    left_glute = 5,
    right_leg = 6,
    right_calf = 7,
    right_shin = 8,
    right_hamstring = 9,
    right_quad = 10,
    right_glute = 11,
    torso_back = 12,
    left_lower_back = 13,
    left_upper_back = 14,
    right_lower_back = 15,
    right_upper_back = 16,
    torso_front = 17,
    left_abdomen = 18,
    left_chest = 19,
    right_abdomen = 20,
    right_chest = 21,
    left_arm = 22,
    left_shoulder = 23,
    left_bicep = 24,
    left_tricep = 25,
    /// Left anterior forearm
    left_brachioradialis = 26,
    /// Left posterior forearm
    left_forearm_extensors = 27,
    right_arm = 28,
    right_shoulder = 29,
    right_bicep = 30,
    right_tricep = 31,
    /// Right anterior forearm
    right_brachioradialis = 32,
    /// Right posterior forearm
    right_forearm_extensors = 33,
    neck = 34,
    throat = 35,
    waist_mid_back = 36,
    waist_front = 37,
    waist_left = 38,
    waist_right = 39,
};

pub const SegmentLapStatus = enum(u8) {
    end = 0,
    fail = 1,
};

pub const SegmentLeaderboardType = enum(u8) {
    overall = 0,
    personal_best = 1,
    connections = 2,
    group = 3,
    challenger = 4,
    kom = 5,
    qom = 6,
    pr = 7,
    goal = 8,
    carrot = 9,
    club_leader = 10,
    rival = 11,
    last = 12,
    recent_best = 13,
    course_record = 14,
};

pub const SegmentDeleteStatus = enum(u8) {
    do_not_delete = 0,
    delete_one = 1,
    delete_all = 2,
};

pub const SegmentSelectionType = enum(u8) {
    starred = 0,
    suggested = 1,
};

pub const SourceType = enum(u8) {
    /// External device connected with ANT
    ant = 0,
    /// External device connected with ANT+
    antplus = 1,
    /// External device connected with BT
    bluetooth = 2,
    /// External device connected with BLE
    bluetooth_low_energy = 3,
    /// External device connected with Wifi
    wifi = 4,
    /// Onboard device
    local = 5,
};

pub const LocalDeviceType = enum(u8) {
    /// Onboard gps receiver
    gps = 0,
    /// Onboard glonass receiver
    glonass = 1,
    /// Onboard gps glonass receiver
    gps_glonass = 2,
    /// Onboard sensor
    accelerometer = 3,
    /// Onboard sensor
    barometer = 4,
    /// Onboard sensor
    temperature = 5,
    /// Onboard wrist HR sensor
    whr = 10,
    /// Onboard software package
    sensor_hub = 12,
};

pub const BleDeviceType = enum(u8) {
    /// GPS that is provided over a proprietary bluetooth service
    connected_gps = 0,
    heart_rate = 1,
    bike_power = 2,
    bike_speed_cadence = 3,
    bike_speed = 4,
    bike_cadence = 5,
    footpod = 6,
    /// Indoor-Bike FTMS protocol
    bike_trainer = 7,
};

pub const AntChannelId = enum(u32) {
    ant_extended_device_number_upper_nibble = 0xF0000000,
    ant_transmission_type_lower_nibble = 0x0F000000,
    ant_device_type = 0x00FF0000,
    ant_device_number = 0x0000FFFF,
};

pub const DisplayOrientation = enum(u8) {
    /// automatic if the device supports it
    auto = 0,
    portrait = 1,
    landscape = 2,
    /// portrait mode but rotated 180 degrees
    portrait_flipped = 3,
    /// landscape mode but rotated 180 degrees
    landscape_flipped = 4,
};

pub const WorkoutEquipment = enum(u8) {
    none = 0,
    swim_fins = 1,
    swim_kickboard = 2,
    swim_paddles = 3,
    swim_pull_buoy = 4,
    swim_snorkel = 5,
};

pub const WatchfaceMode = enum(u8) {
    digital = 0,
    analog = 1,
    connect_iq = 2,
    disabled = 3,
};

pub const DigitalWatchfaceLayout = enum(u8) {
    traditional = 0,
    modern = 1,
    bold = 2,
};

pub const AnalogWatchfaceLayout = enum(u8) {
    minimal = 0,
    traditional = 1,
    modern = 2,
};

pub const RiderPositionType = enum(u8) {
    seated = 0,
    standing = 1,
    transition_to_seated = 2,
    transition_to_standing = 3,
};

pub const PowerPhaseType = enum(u8) {
    power_phase_start_angle = 0,
    power_phase_end_angle = 1,
    power_phase_arc_length = 2,
    power_phase_center = 3,
};

pub const CameraEventType = enum(u8) {
    /// Start of video recording
    video_start = 0,
    /// Mark of video file split (end of one file, beginning of the other)
    video_split = 1,
    /// End of video recording
    video_end = 2,
    /// Still photo taken
    photo_taken = 3,
    video_second_stream_start = 4,
    video_second_stream_split = 5,
    video_second_stream_end = 6,
    /// Mark of video file split start
    video_split_start = 7,
    video_second_stream_split_start = 8,
    /// Mark when a video recording has been paused
    video_pause = 11,
    video_second_stream_pause = 12,
    /// Mark when a video recording has been resumed
    video_resume = 13,
    video_second_stream_resume = 14,
};

pub const SensorType = enum(u8) {
    accelerometer = 0,
    gyroscope = 1,
    /// Magnetometer
    compass = 2,
    barometer = 3,
};

pub const BikeLightNetworkConfigType = enum(u8) {
    auto = 0,
    individual = 4,
    high_visibility = 5,
    trail = 6,
};

pub const CommTimeoutType = enum(u16) {
    /// Timeout pairing to any device
    wildcard_pairing_timeout = 0,
    /// Timeout pairing to previously paired device
    pairing_timeout = 1,
    /// Temporary loss of communications
    connection_lost = 2,
    /// Connection closed due to extended bad communications
    connection_timeout = 3,
};

pub const CameraOrientationType = enum(u8) {
    camera_orientation_0 = 0,
    camera_orientation_90 = 1,
    camera_orientation_180 = 2,
    camera_orientation_270 = 3,
};

pub const AttitudeStage = enum(u8) {
    failed = 0,
    aligning = 1,
    degraded = 2,
    valid = 3,
};

pub const AttitudeValidity = enum(u16) {
    track_angle_heading_valid = 0x0001,
    pitch_valid = 0x0002,
    roll_valid = 0x0004,
    lateral_body_accel_valid = 0x0008,
    normal_body_accel_valid = 0x0010,
    turn_rate_valid = 0x0020,
    hw_fail = 0x0040,
    mag_invalid = 0x0080,
    no_gps = 0x0100,
    gps_invalid = 0x0200,
    solution_coasting = 0x0400,
    true_track_angle = 0x0800,
    magnetic_heading = 0x1000,
};

pub const AutoSyncFrequency = enum(u8) {
    never = 0,
    occasionally = 1,
    frequent = 2,
    once_a_day = 3,
    remote = 4,
};

pub const ExdLayout = enum(u8) {
    full_screen = 0,
    half_vertical = 1,
    half_horizontal = 2,
    half_vertical_right_split = 3,
    half_horizontal_bottom_split = 4,
    full_quarter_split = 5,
    half_vertical_left_split = 6,
    half_horizontal_top_split = 7,
    /// The EXD may display the configured concepts in any layout it sees fit.
    dynamic = 8,
};

pub const ExdDisplayType = enum(u8) {
    numerical = 0,
    simple = 1,
    graph = 2,
    bar = 3,
    circle_graph = 4,
    virtual_partner = 5,
    balance = 6,
    string_list = 7,
    string = 8,
    simple_dynamic_icon = 9,
    gauge = 10,
};

pub const ExdDataUnits = enum(u8) {
    no_units = 0,
    laps = 1,
    miles_per_hour = 2,
    kilometers_per_hour = 3,
    feet_per_hour = 4,
    meters_per_hour = 5,
    degrees_celsius = 6,
    degrees_farenheit = 7,
    zone = 8,
    gear = 9,
    rpm = 10,
    bpm = 11,
    degrees = 12,
    millimeters = 13,
    meters = 14,
    kilometers = 15,
    feet = 16,
    yards = 17,
    kilofeet = 18,
    miles = 19,
    time = 20,
    enum_turn_type = 21,
    percent = 22,
    watts = 23,
    watts_per_kilogram = 24,
    enum_battery_status = 25,
    enum_bike_light_beam_angle_mode = 26,
    enum_bike_light_battery_status = 27,
    enum_bike_light_network_config_type = 28,
    lights = 29,
    seconds = 30,
    minutes = 31,
    hours = 32,
    calories = 33,
    kilojoules = 34,
    milliseconds = 35,
    second_per_mile = 36,
    second_per_kilometer = 37,
    centimeter = 38,
    enum_course_point = 39,
    bradians = 40,
    enum_sport = 41,
    inches_hg = 42,
    mm_hg = 43,
    mbars = 44,
    hecto_pascals = 45,
    feet_per_min = 46,
    meters_per_min = 47,
    meters_per_sec = 48,
    eight_cardinal = 49,
};

pub const ExdQualifiers = enum(u8) {
    no_qualifier = 0,
    instantaneous = 1,
    average = 2,
    lap = 3,
    maximum = 4,
    maximum_average = 5,
    maximum_lap = 6,
    last_lap = 7,
    average_lap = 8,
    to_destination = 9,
    to_go = 10,
    to_next = 11,
    next_course_point = 12,
    total = 13,
    three_second_average = 14,
    ten_second_average = 15,
    thirty_second_average = 16,
    percent_maximum = 17,
    percent_maximum_average = 18,
    lap_percent_maximum = 19,
    elapsed = 20,
    sunrise = 21,
    sunset = 22,
    compared_to_virtual_partner = 23,
    maximum_24h = 24,
    minimum_24h = 25,
    minimum = 26,
    first = 27,
    second = 28,
    third = 29,
    shifter = 30,
    last_sport = 31,
    moving = 32,
    stopped = 33,
    estimated_total = 34,
    zone_9 = 242,
    zone_8 = 243,
    zone_7 = 244,
    zone_6 = 245,
    zone_5 = 246,
    zone_4 = 247,
    zone_3 = 248,
    zone_2 = 249,
    zone_1 = 250,
};

pub const ExdDescriptors = enum(u8) {
    bike_light_battery_status = 0,
    beam_angle_status = 1,
    batery_level = 2,
    light_network_mode = 3,
    number_lights_connected = 4,
    cadence = 5,
    distance = 6,
    estimated_time_of_arrival = 7,
    heading = 8,
    time = 9,
    battery_level = 10,
    trainer_resistance = 11,
    trainer_target_power = 12,
    time_seated = 13,
    time_standing = 14,
    elevation = 15,
    grade = 16,
    ascent = 17,
    descent = 18,
    vertical_speed = 19,
    di2_battery_level = 20,
    front_gear = 21,
    rear_gear = 22,
    gear_ratio = 23,
    heart_rate = 24,
    heart_rate_zone = 25,
    time_in_heart_rate_zone = 26,
    heart_rate_reserve = 27,
    calories = 28,
    gps_accuracy = 29,
    gps_signal_strength = 30,
    temperature = 31,
    time_of_day = 32,
    balance = 33,
    pedal_smoothness = 34,
    power = 35,
    functional_threshold_power = 36,
    intensity_factor = 37,
    work = 38,
    power_ratio = 39,
    normalized_power = 40,
    training_stress_Score = 41,
    time_on_zone = 42,
    speed = 43,
    laps = 44,
    reps = 45,
    workout_step = 46,
    course_distance = 47,
    navigation_distance = 48,
    course_estimated_time_of_arrival = 49,
    navigation_estimated_time_of_arrival = 50,
    course_time = 51,
    navigation_time = 52,
    course_heading = 53,
    navigation_heading = 54,
    power_zone = 55,
    torque_effectiveness = 56,
    timer_time = 57,
    power_weight_ratio = 58,
    left_platform_center_offset = 59,
    right_platform_center_offset = 60,
    left_power_phase_start_angle = 61,
    right_power_phase_start_angle = 62,
    left_power_phase_finish_angle = 63,
    right_power_phase_finish_angle = 64,
    /// Combined gear information
    gears = 65,
    pace = 66,
    training_effect = 67,
    vertical_oscillation = 68,
    vertical_ratio = 69,
    ground_contact_time = 70,
    left_ground_contact_time_balance = 71,
    right_ground_contact_time_balance = 72,
    stride_length = 73,
    running_cadence = 74,
    performance_condition = 75,
    course_type = 76,
    time_in_power_zone = 77,
    navigation_turn = 78,
    course_location = 79,
    navigation_location = 80,
    compass = 81,
    gear_combo = 82,
    muscle_oxygen = 83,
    icon = 84,
    compass_heading = 85,
    gps_heading = 86,
    gps_elevation = 87,
    anaerobic_training_effect = 88,
    course = 89,
    off_course = 90,
    glide_ratio = 91,
    vertical_distance = 92,
    vmg = 93,
    ambient_pressure = 94,
    pressure = 95,
    vam = 96,
};

pub const AutoActivityDetect = enum(u32) {
    none = 0x00000000,
    running = 0x00000001,
    cycling = 0x00000002,
    swimming = 0x00000004,
    walking = 0x00000008,
    elliptical = 0x00000020,
    sedentary = 0x00000400,
};

pub const SupportedExdScreenLayouts = enum(u32) {
    full_screen = 0x00000001,
    half_vertical = 0x00000002,
    half_horizontal = 0x00000004,
    half_vertical_right_split = 0x00000008,
    half_horizontal_bottom_split = 0x00000010,
    full_quarter_split = 0x00000020,
    half_vertical_left_split = 0x00000040,
    half_horizontal_top_split = 0x00000080,
};

pub const FitBaseType = enum(u8) {
    _enum = 0,
    sint8 = 1,
    uint8 = 2,
    sint16 = 131,
    uint16 = 132,
    sint32 = 133,
    uint32 = 134,
    string = 7,
    float32 = 136,
    float64 = 137,
    uint8z = 10,
    uint16z = 139,
    uint32z = 140,
    byte = 13,
    sint64 = 142,
    uint64 = 143,
    uint64z = 144,
};

pub const TurnType = enum(u8) {
    arriving_idx = 0,
    arriving_left_idx = 1,
    arriving_right_idx = 2,
    arriving_via_idx = 3,
    arriving_via_left_idx = 4,
    arriving_via_right_idx = 5,
    bear_keep_left_idx = 6,
    bear_keep_right_idx = 7,
    continue_idx = 8,
    exit_left_idx = 9,
    exit_right_idx = 10,
    ferry_idx = 11,
    roundabout_45_idx = 12,
    roundabout_90_idx = 13,
    roundabout_135_idx = 14,
    roundabout_180_idx = 15,
    roundabout_225_idx = 16,
    roundabout_270_idx = 17,
    roundabout_315_idx = 18,
    roundabout_360_idx = 19,
    roundabout_neg_45_idx = 20,
    roundabout_neg_90_idx = 21,
    roundabout_neg_135_idx = 22,
    roundabout_neg_180_idx = 23,
    roundabout_neg_225_idx = 24,
    roundabout_neg_270_idx = 25,
    roundabout_neg_315_idx = 26,
    roundabout_neg_360_idx = 27,
    roundabout_generic_idx = 28,
    roundabout_neg_generic_idx = 29,
    sharp_turn_left_idx = 30,
    sharp_turn_right_idx = 31,
    turn_left_idx = 32,
    turn_right_idx = 33,
    uturn_left_idx = 34,
    uturn_right_idx = 35,
    icon_inv_idx = 36,
    icon_idx_cnt = 37,
};

pub const BikeLightBeamAngleMode = enum(u8) {
    manual = 0,
    auto = 1,
};

pub const FitBaseUnit = enum(u16) {
    other = 0,
    kilogram = 1,
    pound = 2,
};

pub const SetType = enum(u8) {
    rest = 0,
    active = 1,
};

pub const MaxMetCategory = enum(u8) {
    generic = 0,
    cycling = 1,
};

pub const ExerciseCategory = enum(u16) {
    bench_press = 0,
    calf_raise = 1,
    cardio = 2,
    carry = 3,
    chop = 4,
    core = 5,
    crunch = 6,
    curl = 7,
    deadlift = 8,
    flye = 9,
    hip_raise = 10,
    hip_stability = 11,
    hip_swing = 12,
    hyperextension = 13,
    lateral_raise = 14,
    leg_curl = 15,
    leg_raise = 16,
    lunge = 17,
    olympic_lift = 18,
    plank = 19,
    plyo = 20,
    pull_up = 21,
    push_up = 22,
    row = 23,
    shoulder_press = 24,
    shoulder_stability = 25,
    shrug = 26,
    sit_up = 27,
    squat = 28,
    total_body = 29,
    triceps_extension = 30,
    warm_up = 31,
    run = 32,
    bike = 33,
    /// Exercises within workouts that use GPS/sensors rather than rep counting
    cardio_sensors = 34,
    move = 35,
    pose = 36,
    banded_exercises = 37,
    battle_rope = 38,
    elliptical = 39,
    floor_climb = 40,
    indoor_bike = 41,
    indoor_row = 42,
    ladder = 43,
    sandbag = 44,
    sled = 45,
    sledge_hammer = 46,
    stair_stepper = 47,
    suspension = 49,
    tire = 50,
    run_indoor = 52,
    bike_outdoor = 53,
    unknown = 65534,
};

pub const BenchPressExerciseName = enum(u16) {
    alternating_dumbbell_chest_press_on_swiss_ball = 0,
    barbell_bench_press = 1,
    barbell_board_bench_press = 2,
    barbell_floor_press = 3,
    close_grip_barbell_bench_press = 4,
    decline_dumbbell_bench_press = 5,
    dumbbell_bench_press = 6,
    dumbbell_floor_press = 7,
    incline_barbell_bench_press = 8,
    incline_dumbbell_bench_press = 9,
    incline_smith_machine_bench_press = 10,
    isometric_barbell_bench_press = 11,
    kettlebell_chest_press = 12,
    neutral_grip_dumbbell_bench_press = 13,
    neutral_grip_dumbbell_incline_bench_press = 14,
    one_arm_floor_press = 15,
    weighted_one_arm_floor_press = 16,
    partial_lockout = 17,
    reverse_grip_barbell_bench_press = 18,
    reverse_grip_incline_bench_press = 19,
    single_arm_cable_chest_press = 20,
    single_arm_dumbbell_bench_press = 21,
    smith_machine_bench_press = 22,
    swiss_ball_dumbbell_chest_press = 23,
    triple_stop_barbell_bench_press = 24,
    wide_grip_barbell_bench_press = 25,
    alternating_dumbbell_chest_press = 26,
};

pub const CalfRaiseExerciseName = enum(u16) {
    _3_way_calf_raise = 0,
    _3_way_weighted_calf_raise = 1,
    _3_way_single_leg_calf_raise = 2,
    _3_way_weighted_single_leg_calf_raise = 3,
    donkey_calf_raise = 4,
    weighted_donkey_calf_raise = 5,
    seated_calf_raise = 6,
    weighted_seated_calf_raise = 7,
    seated_dumbbell_toe_raise = 8,
    single_leg_bent_knee_calf_raise = 9,
    weighted_single_leg_bent_knee_calf_raise = 10,
    single_leg_decline_push_up = 11,
    single_leg_donkey_calf_raise = 12,
    weighted_single_leg_donkey_calf_raise = 13,
    single_leg_hip_raise_with_knee_hold = 14,
    single_leg_standing_calf_raise = 15,
    single_leg_standing_dumbbell_calf_raise = 16,
    standing_barbell_calf_raise = 17,
    standing_calf_raise = 18,
    weighted_standing_calf_raise = 19,
    standing_dumbbell_calf_raise = 20,
};

pub const CardioExerciseName = enum(u16) {
    bob_and_weave_circle = 0,
    weighted_bob_and_weave_circle = 1,
    cardio_core_crawl = 2,
    weighted_cardio_core_crawl = 3,
    double_under = 4,
    weighted_double_under = 5,
    jump_rope = 6,
    weighted_jump_rope = 7,
    jump_rope_crossover = 8,
    weighted_jump_rope_crossover = 9,
    jump_rope_jog = 10,
    weighted_jump_rope_jog = 11,
    jumping_jacks = 12,
    weighted_jumping_jacks = 13,
    ski_moguls = 14,
    weighted_ski_moguls = 15,
    split_jacks = 16,
    weighted_split_jacks = 17,
    squat_jacks = 18,
    weighted_squat_jacks = 19,
    triple_under = 20,
    weighted_triple_under = 21,
    elliptical = 22,
    spinning = 23,
    pole_paddle_forward_wheelchair = 24,
    pole_paddle_backward_wheelchair = 25,
    pole_handcycle_forward_wheelchair = 26,
    pole_handcycle_backward_wheelchair = 27,
    pole_rainbow_wheelchair = 28,
    double_punch_forward_wheelchair = 29,
    double_punch_down_wheelchair = 30,
    double_punch_sideways_wheelchair = 31,
    double_punch_up_wheelchair = 32,
    sit_ski_wheelchair = 33,
    sitting_jacks_wheelchair = 34,
    punch_forward_wheelchair = 35,
    punch_down_wheelchair = 36,
    punch_sideways_wheelchair = 37,
    punch_up_wheelchair = 38,
    punch_bag_wheelchair = 39,
    pole_dd_ff_uu_wheelchair = 40,
    butterfly_arms_wheelchair = 41,
    punch = 42,
};

pub const CarryExerciseName = enum(u16) {
    bar_holds = 0,
    farmers_walk = 1,
    farmers_walk_on_toes = 2,
    hex_dumbbell_hold = 3,
    overhead_carry = 4,
    dumbbell_waiter_carry = 5,
    farmers_carry_walk_lunge = 6,
    farmers_carry = 7,
    farmers_carry_on_toes = 8,
};

pub const ChopExerciseName = enum(u16) {
    cable_pull_through = 0,
    cable_rotational_lift = 1,
    cable_woodchop = 2,
    cross_chop_to_knee = 3,
    weighted_cross_chop_to_knee = 4,
    dumbbell_chop = 5,
    half_kneeling_rotation = 6,
    weighted_half_kneeling_rotation = 7,
    half_kneeling_rotational_chop = 8,
    half_kneeling_rotational_reverse_chop = 9,
    half_kneeling_stability_chop = 10,
    half_kneeling_stability_reverse_chop = 11,
    kneeling_rotational_chop = 12,
    kneeling_rotational_reverse_chop = 13,
    kneeling_stability_chop = 14,
    kneeling_woodchopper = 15,
    medicine_ball_wood_chops = 16,
    power_squat_chops = 17,
    weighted_power_squat_chops = 18,
    standing_rotational_chop = 19,
    standing_split_rotational_chop = 20,
    standing_split_rotational_reverse_chop = 21,
    standing_stability_reverse_chop = 22,
};

pub const CoreExerciseName = enum(u16) {
    abs_jabs = 0,
    weighted_abs_jabs = 1,
    alternating_plate_reach = 2,
    barbell_rollout = 3,
    weighted_barbell_rollout = 4,
    body_bar_oblique_twist = 5,
    cable_core_press = 6,
    cable_side_bend = 7,
    side_bend = 8,
    weighted_side_bend = 9,
    crescent_circle = 10,
    weighted_crescent_circle = 11,
    cycling_russian_twist = 12,
    weighted_cycling_russian_twist = 13,
    elevated_feet_russian_twist = 14,
    weighted_elevated_feet_russian_twist = 15,
    half_turkish_get_up = 16,
    kettlebell_windmill = 17,
    kneeling_ab_wheel = 18,
    weighted_kneeling_ab_wheel = 19,
    modified_front_lever = 20,
    open_knee_tucks = 21,
    weighted_open_knee_tucks = 22,
    side_abs_leg_lift = 23,
    weighted_side_abs_leg_lift = 24,
    swiss_ball_jackknife = 25,
    weighted_swiss_ball_jackknife = 26,
    swiss_ball_pike = 27,
    weighted_swiss_ball_pike = 28,
    swiss_ball_rollout = 29,
    weighted_swiss_ball_rollout = 30,
    triangle_hip_press = 31,
    weighted_triangle_hip_press = 32,
    trx_suspended_jackknife = 33,
    weighted_trx_suspended_jackknife = 34,
    u_boat = 35,
    weighted_u_boat = 36,
    windmill_switches = 37,
    weighted_windmill_switches = 38,
    alternating_slide_out = 39,
    weighted_alternating_slide_out = 40,
    ghd_back_extensions = 41,
    weighted_ghd_back_extensions = 42,
    overhead_walk = 43,
    inchworm = 44,
    weighted_modified_front_lever = 45,
    russian_twist = 46,
    /// Deprecated do not use
    abdominal_leg_rotations = 47,
    arm_and_leg_extension_on_knees = 48,
    bicycle = 49,
    bicep_curl_with_leg_extension = 50,
    cat_cow = 51,
    corkscrew = 52,
    criss_cross = 53,
    /// Deprecated do not use
    criss_cross_with_ball = 54,
    double_leg_stretch = 55,
    knee_folds = 56,
    lower_lift = 57,
    neck_pull = 58,
    pelvic_clocks = 59,
    roll_over = 60,
    roll_up = 61,
    rolling = 62,
    rowing_1 = 63,
    rowing_2 = 64,
    scissors = 65,
    single_leg_circles = 66,
    single_leg_stretch = 67,
    /// Deprecated do not use
    snake_twist_1_and_2 = 68,
    swan = 69,
    swimming = 70,
    teaser = 71,
    the_hundred = 72,
    bicep_curl_with_leg_extension_with_weights = 73,
    hanging_l_sit = 75,
    lower_lift_with_weights = 77,
    ring_l_sit = 79,
    rowing_1_with_weights = 80,
    rowing_2_with_weights = 81,
    scissors_with_weights = 82,
    single_leg_stretch_with_weights = 83,
    toes_to_elbows = 84,
    weighted_criss_cross = 85,
    weighted_double_leg_stretch = 86,
    weighted_the_hundred = 87,
    l_sit = 88,
    turkish_get_up = 89,
    weighted_ring_l_sit = 90,
    weighted_hanging_l_sit = 91,
    weighted_l_sit = 92,
    side_bend_low_wheelchair = 93,
    side_bend_mid_wheelchair = 94,
    side_bend_high_wheelchair = 95,
    seated_side_bend = 96,
};

pub const CrunchExerciseName = enum(u16) {
    bicycle_crunch = 0,
    cable_crunch = 1,
    circular_arm_crunch = 2,
    crossed_arms_crunch = 3,
    weighted_crossed_arms_crunch = 4,
    cross_leg_reverse_crunch = 5,
    weighted_cross_leg_reverse_crunch = 6,
    crunch_chop = 7,
    weighted_crunch_chop = 8,
    double_crunch = 9,
    weighted_double_crunch = 10,
    elbow_to_knee_crunch = 11,
    weighted_elbow_to_knee_crunch = 12,
    flutter_kicks = 13,
    weighted_flutter_kicks = 14,
    foam_roller_reverse_crunch_on_bench = 15,
    weighted_foam_roller_reverse_crunch_on_bench = 16,
    foam_roller_reverse_crunch_with_dumbbell = 17,
    foam_roller_reverse_crunch_with_medicine_ball = 18,
    frog_press = 19,
    hanging_knee_raise_oblique_crunch = 20,
    weighted_hanging_knee_raise_oblique_crunch = 21,
    hip_crossover = 22,
    weighted_hip_crossover = 23,
    hollow_rock = 24,
    weighted_hollow_rock = 25,
    incline_reverse_crunch = 26,
    weighted_incline_reverse_crunch = 27,
    kneeling_cable_crunch = 28,
    kneeling_cross_crunch = 29,
    weighted_kneeling_cross_crunch = 30,
    kneeling_oblique_cable_crunch = 31,
    knees_to_elbow = 32,
    leg_extensions = 33,
    weighted_leg_extensions = 34,
    leg_levers = 35,
    mcgill_curl_up = 36,
    weighted_mcgill_curl_up = 37,
    modified_pilates_roll_up_with_ball = 38,
    weighted_modified_pilates_roll_up_with_ball = 39,
    pilates_crunch = 40,
    weighted_pilates_crunch = 41,
    pilates_roll_up_with_ball = 42,
    weighted_pilates_roll_up_with_ball = 43,
    raised_legs_crunch = 44,
    weighted_raised_legs_crunch = 45,
    reverse_crunch = 46,
    weighted_reverse_crunch = 47,
    reverse_crunch_on_a_bench = 48,
    weighted_reverse_crunch_on_a_bench = 49,
    reverse_curl_and_lift = 50,
    weighted_reverse_curl_and_lift = 51,
    rotational_lift = 52,
    weighted_rotational_lift = 53,
    seated_alternating_reverse_crunch = 54,
    weighted_seated_alternating_reverse_crunch = 55,
    seated_leg_u = 56,
    weighted_seated_leg_u = 57,
    side_to_side_crunch_and_weave = 58,
    weighted_side_to_side_crunch_and_weave = 59,
    single_leg_reverse_crunch = 60,
    weighted_single_leg_reverse_crunch = 61,
    skater_crunch_cross = 62,
    weighted_skater_crunch_cross = 63,
    standing_cable_crunch = 64,
    standing_side_crunch = 65,
    step_climb = 66,
    weighted_step_climb = 67,
    swiss_ball_crunch = 68,
    swiss_ball_reverse_crunch = 69,
    weighted_swiss_ball_reverse_crunch = 70,
    swiss_ball_russian_twist = 71,
    weighted_swiss_ball_russian_twist = 72,
    swiss_ball_side_crunch = 73,
    weighted_swiss_ball_side_crunch = 74,
    thoracic_crunches_on_foam_roller = 75,
    weighted_thoracic_crunches_on_foam_roller = 76,
    triceps_crunch = 77,
    weighted_bicycle_crunch = 78,
    weighted_crunch = 79,
    weighted_swiss_ball_crunch = 80,
    toes_to_bar = 81,
    weighted_toes_to_bar = 82,
    crunch = 83,
    straight_leg_crunch_with_ball = 84,
    leg_climb_crunch = 86,
};

pub const CurlExerciseName = enum(u16) {
    alternating_dumbbell_biceps_curl = 0,
    alternating_dumbbell_biceps_curl_on_swiss_ball = 1,
    alternating_incline_dumbbell_biceps_curl = 2,
    barbell_biceps_curl = 3,
    barbell_reverse_wrist_curl = 4,
    barbell_wrist_curl = 5,
    behind_the_back_barbell_reverse_wrist_curl = 6,
    behind_the_back_one_arm_cable_curl = 7,
    cable_biceps_curl = 8,
    cable_hammer_curl = 9,
    cheating_barbell_biceps_curl = 10,
    close_grip_ez_bar_biceps_curl = 11,
    cross_body_dumbbell_hammer_curl = 12,
    dead_hang_biceps_curl = 13,
    decline_hammer_curl = 14,
    dumbbell_biceps_curl_with_static_hold = 15,
    dumbbell_hammer_curl = 16,
    dumbbell_reverse_wrist_curl = 17,
    dumbbell_wrist_curl = 18,
    ez_bar_preacher_curl = 19,
    forward_bend_biceps_curl = 20,
    hammer_curl_to_press = 21,
    incline_dumbbell_biceps_curl = 22,
    incline_offset_thumb_dumbbell_curl = 23,
    kettlebell_biceps_curl = 24,
    lying_concentration_cable_curl = 25,
    one_arm_preacher_curl = 26,
    plate_pinch_curl = 27,
    preacher_curl_with_cable = 28,
    reverse_ez_bar_curl = 29,
    reverse_grip_wrist_curl = 30,
    reverse_grip_barbell_biceps_curl = 31,
    seated_alternating_dumbbell_biceps_curl = 32,
    seated_dumbbell_biceps_curl = 33,
    seated_reverse_dumbbell_curl = 34,
    split_stance_offset_pinky_dumbbell_curl = 35,
    standing_alternating_dumbbell_curls = 36,
    standing_dumbbell_biceps_curl = 37,
    standing_ez_bar_biceps_curl = 38,
    static_curl = 39,
    swiss_ball_dumbbell_overhead_triceps_extension = 40,
    swiss_ball_ez_bar_preacher_curl = 41,
    twisting_standing_dumbbell_biceps_curl = 42,
    wide_grip_ez_bar_biceps_curl = 43,
    one_arm_concentration_curl = 44,
    standing_zottman_biceps_curl = 45,
    dumbbell_biceps_curl = 46,
    drag_curl_wheelchair = 47,
    dumbbell_biceps_curl_wheelchair = 48,
    bottle_curl = 49,
    seated_bottle_curl = 50,
};

pub const DeadliftExerciseName = enum(u16) {
    barbell_deadlift = 0,
    barbell_straight_leg_deadlift = 1,
    dumbbell_deadlift = 2,
    dumbbell_single_leg_deadlift_to_row = 3,
    dumbbell_straight_leg_deadlift = 4,
    kettlebell_floor_to_shelf = 5,
    one_arm_one_leg_deadlift = 6,
    rack_pull = 7,
    rotational_dumbbell_straight_leg_deadlift = 8,
    single_arm_deadlift = 9,
    single_leg_barbell_deadlift = 10,
    single_leg_barbell_straight_leg_deadlift = 11,
    single_leg_deadlift_with_barbell = 12,
    single_leg_rdl_circuit = 13,
    single_leg_romanian_deadlift_with_dumbbell = 14,
    sumo_deadlift = 15,
    sumo_deadlift_high_pull = 16,
    trap_bar_deadlift = 17,
    wide_grip_barbell_deadlift = 18,
    kettlebell_deadlift = 20,
    kettlebell_sumo_deadlift = 21,
    romanian_deadlift = 23,
    single_leg_romanian_deadlift_circuit = 24,
    straight_leg_deadlift = 25,
};

pub const FlyeExerciseName = enum(u16) {
    cable_crossover = 0,
    decline_dumbbell_flye = 1,
    dumbbell_flye = 2,
    incline_dumbbell_flye = 3,
    kettlebell_flye = 4,
    kneeling_rear_flye = 5,
    single_arm_standing_cable_reverse_flye = 6,
    swiss_ball_dumbbell_flye = 7,
    arm_rotations = 8,
    hug_a_tree = 9,
    face_down_incline_reverse_flye = 10,
    incline_reverse_flye = 11,
    rear_delt_fly_wheelchair = 12,
};

pub const HipRaiseExerciseName = enum(u16) {
    barbell_hip_thrust_on_floor = 0,
    barbell_hip_thrust_with_bench = 1,
    bent_knee_swiss_ball_reverse_hip_raise = 2,
    weighted_bent_knee_swiss_ball_reverse_hip_raise = 3,
    bridge_with_leg_extension = 4,
    weighted_bridge_with_leg_extension = 5,
    clam_bridge = 6,
    front_kick_tabletop = 7,
    weighted_front_kick_tabletop = 8,
    hip_extension_and_cross = 9,
    weighted_hip_extension_and_cross = 10,
    hip_raise = 11,
    weighted_hip_raise = 12,
    hip_raise_with_feet_on_swiss_ball = 13,
    weighted_hip_raise_with_feet_on_swiss_ball = 14,
    hip_raise_with_head_on_bosu_ball = 15,
    weighted_hip_raise_with_head_on_bosu_ball = 16,
    hip_raise_with_head_on_swiss_ball = 17,
    weighted_hip_raise_with_head_on_swiss_ball = 18,
    hip_raise_with_knee_squeeze = 19,
    weighted_hip_raise_with_knee_squeeze = 20,
    incline_rear_leg_extension = 21,
    weighted_incline_rear_leg_extension = 22,
    kettlebell_swing = 23,
    marching_hip_raise = 24,
    weighted_marching_hip_raise = 25,
    marching_hip_raise_with_feet_on_a_swiss_ball = 26,
    weighted_marching_hip_raise_with_feet_on_a_swiss_ball = 27,
    reverse_hip_raise = 28,
    weighted_reverse_hip_raise = 29,
    single_leg_hip_raise = 30,
    weighted_single_leg_hip_raise = 31,
    single_leg_hip_raise_with_foot_on_bench = 32,
    weighted_single_leg_hip_raise_with_foot_on_bench = 33,
    single_leg_hip_raise_with_foot_on_bosu_ball = 34,
    weighted_single_leg_hip_raise_with_foot_on_bosu_ball = 35,
    single_leg_hip_raise_with_foot_on_foam_roller = 36,
    weighted_single_leg_hip_raise_with_foot_on_foam_roller = 37,
    single_leg_hip_raise_with_foot_on_medicine_ball = 38,
    weighted_single_leg_hip_raise_with_foot_on_medicine_ball = 39,
    single_leg_hip_raise_with_head_on_bosu_ball = 40,
    weighted_single_leg_hip_raise_with_head_on_bosu_ball = 41,
    weighted_clam_bridge = 42,
    single_leg_swiss_ball_hip_raise_and_leg_curl = 43,
    clams = 44,
    /// Deprecated do not use
    inner_thigh_circles = 45,
    /// Deprecated do not use
    inner_thigh_side_lift = 46,
    leg_circles = 47,
    leg_lift = 48,
    leg_lift_in_external_rotation = 49,
};

pub const HipStabilityExerciseName = enum(u16) {
    band_side_lying_leg_raise = 0,
    dead_bug = 1,
    weighted_dead_bug = 2,
    external_hip_raise = 3,
    weighted_external_hip_raise = 4,
    fire_hydrant_kicks = 5,
    weighted_fire_hydrant_kicks = 6,
    hip_circles = 7,
    weighted_hip_circles = 8,
    inner_thigh_lift = 9,
    weighted_inner_thigh_lift = 10,
    lateral_walks_with_band_at_ankles = 11,
    pretzel_side_kick = 12,
    weighted_pretzel_side_kick = 13,
    prone_hip_internal_rotation = 14,
    weighted_prone_hip_internal_rotation = 15,
    quadruped = 16,
    quadruped_hip_extension = 17,
    weighted_quadruped_hip_extension = 18,
    quadruped_with_leg_lift = 19,
    weighted_quadruped_with_leg_lift = 20,
    side_lying_leg_raise = 21,
    weighted_side_lying_leg_raise = 22,
    sliding_hip_adduction = 23,
    weighted_sliding_hip_adduction = 24,
    standing_adduction = 25,
    weighted_standing_adduction = 26,
    standing_cable_hip_abduction = 27,
    standing_hip_abduction = 28,
    weighted_standing_hip_abduction = 29,
    standing_rear_leg_raise = 30,
    weighted_standing_rear_leg_raise = 31,
    supine_hip_internal_rotation = 32,
    weighted_supine_hip_internal_rotation = 33,
    lying_abduction_stretch = 34,
};

pub const HipSwingExerciseName = enum(u16) {
    single_arm_kettlebell_swing = 0,
    single_arm_dumbbell_swing = 1,
    step_out_swing = 2,
    one_arm_swing = 3,
};

pub const HyperextensionExerciseName = enum(u16) {
    back_extension_with_opposite_arm_and_leg_reach = 0,
    weighted_back_extension_with_opposite_arm_and_leg_reach = 1,
    base_rotations = 2,
    weighted_base_rotations = 3,
    bent_knee_reverse_hyperextension = 4,
    weighted_bent_knee_reverse_hyperextension = 5,
    hollow_hold_and_roll = 6,
    weighted_hollow_hold_and_roll = 7,
    kicks = 8,
    weighted_kicks = 9,
    knee_raises = 10,
    weighted_knee_raises = 11,
    kneeling_superman = 12,
    weighted_kneeling_superman = 13,
    lat_pull_down_with_row = 14,
    medicine_ball_deadlift_to_reach = 15,
    one_arm_one_leg_row = 16,
    one_arm_row_with_band = 17,
    overhead_lunge_with_medicine_ball = 18,
    plank_knee_tucks = 19,
    weighted_plank_knee_tucks = 20,
    side_step = 21,
    weighted_side_step = 22,
    single_leg_back_extension = 23,
    weighted_single_leg_back_extension = 24,
    spine_extension = 25,
    weighted_spine_extension = 26,
    static_back_extension = 27,
    weighted_static_back_extension = 28,
    superman_from_floor = 29,
    weighted_superman_from_floor = 30,
    swiss_ball_back_extension = 31,
    weighted_swiss_ball_back_extension = 32,
    swiss_ball_hyperextension = 33,
    weighted_swiss_ball_hyperextension = 34,
    swiss_ball_opposite_arm_and_leg_lift = 35,
    weighted_swiss_ball_opposite_arm_and_leg_lift = 36,
    superman_on_swiss_ball = 37,
    cobra = 38,
    /// Deprecated do not use
    supine_floor_barre = 39,
};

pub const LateralRaiseExerciseName = enum(u16) {
    _45_degree_cable_external_rotation = 0,
    alternating_lateral_raise_with_static_hold = 1,
    bar_muscle_up = 2,
    bent_over_lateral_raise = 3,
    cable_diagonal_raise = 4,
    cable_front_raise = 5,
    calorie_row = 6,
    combo_shoulder_raise = 7,
    dumbbell_diagonal_raise = 8,
    dumbbell_v_raise = 9,
    front_raise = 10,
    leaning_dumbbell_lateral_raise = 11,
    lying_dumbbell_raise = 12,
    muscle_up = 13,
    one_arm_cable_lateral_raise = 14,
    overhand_grip_rear_lateral_raise = 15,
    plate_raises = 16,
    ring_dip = 17,
    weighted_ring_dip = 18,
    ring_muscle_up = 19,
    weighted_ring_muscle_up = 20,
    rope_climb = 21,
    weighted_rope_climb = 22,
    scaption = 23,
    seated_lateral_raise = 24,
    seated_rear_lateral_raise = 25,
    side_lying_lateral_raise = 26,
    standing_lift = 27,
    suspended_row = 28,
    underhand_grip_rear_lateral_raise = 29,
    wall_slide = 30,
    weighted_wall_slide = 31,
    arm_circles = 32,
    shaving_the_head = 33,
    dumbbell_lateral_raise = 34,
    ring_dip_kipping = 36,
    wall_walk = 37,
    dumbbell_front_raise_wheelchair = 38,
    dumbbell_lateral_raise_wheelchair = 39,
    pole_double_arm_overhead_and_forward_wheelchair = 40,
    pole_straight_arm_overhead_wheelchair = 41,
};

pub const LegCurlExerciseName = enum(u16) {
    leg_curl = 0,
    weighted_leg_curl = 1,
    good_morning = 2,
    seated_barbell_good_morning = 3,
    single_leg_barbell_good_morning = 4,
    single_leg_sliding_leg_curl = 5,
    sliding_leg_curl = 6,
    split_barbell_good_morning = 7,
    split_stance_extension = 8,
    staggered_stance_good_morning = 9,
    swiss_ball_hip_raise_and_leg_curl = 10,
    zercher_good_morning = 11,
    band_good_morning = 12,
    bar_good_morning = 13,
};

pub const LegRaiseExerciseName = enum(u16) {
    hanging_knee_raise = 0,
    hanging_leg_raise = 1,
    weighted_hanging_leg_raise = 2,
    hanging_single_leg_raise = 3,
    weighted_hanging_single_leg_raise = 4,
    kettlebell_leg_raises = 5,
    leg_lowering_drill = 6,
    weighted_leg_lowering_drill = 7,
    lying_straight_leg_raise = 8,
    weighted_lying_straight_leg_raise = 9,
    medicine_ball_leg_drops = 10,
    quadruped_leg_raise = 11,
    weighted_quadruped_leg_raise = 12,
    reverse_leg_raise = 13,
    weighted_reverse_leg_raise = 14,
    reverse_leg_raise_on_swiss_ball = 15,
    weighted_reverse_leg_raise_on_swiss_ball = 16,
    single_leg_lowering_drill = 17,
    weighted_single_leg_lowering_drill = 18,
    weighted_hanging_knee_raise = 19,
    lateral_stepover = 20,
    weighted_lateral_stepover = 21,
};

pub const LungeExerciseName = enum(u16) {
    overhead_lunge = 0,
    lunge_matrix = 1,
    weighted_lunge_matrix = 2,
    alternating_barbell_forward_lunge = 3,
    alternating_dumbbell_lunge_with_reach = 4,
    back_foot_elevated_dumbbell_split_squat = 5,
    barbell_box_lunge = 6,
    barbell_bulgarian_split_squat = 7,
    barbell_crossover_lunge = 8,
    barbell_front_split_squat = 9,
    barbell_lunge = 10,
    barbell_reverse_lunge = 11,
    barbell_side_lunge = 12,
    barbell_split_squat = 13,
    core_control_rear_lunge = 14,
    diagonal_lunge = 15,
    drop_lunge = 16,
    dumbbell_box_lunge = 17,
    dumbbell_bulgarian_split_squat = 18,
    dumbbell_crossover_lunge = 19,
    dumbbell_diagonal_lunge = 20,
    dumbbell_lunge = 21,
    dumbbell_lunge_and_rotation = 22,
    dumbbell_overhead_bulgarian_split_squat = 23,
    dumbbell_reverse_lunge_to_high_knee_and_press = 24,
    dumbbell_side_lunge = 25,
    elevated_front_foot_barbell_split_squat = 26,
    front_foot_elevated_dumbbell_split_squat = 27,
    gunslinger_lunge = 28,
    lawnmower_lunge = 29,
    low_lunge_with_isometric_adduction = 30,
    low_side_to_side_lunge = 31,
    lunge = 32,
    weighted_lunge = 33,
    lunge_with_arm_reach = 34,
    lunge_with_diagonal_reach = 35,
    lunge_with_side_bend = 36,
    offset_dumbbell_lunge = 37,
    offset_dumbbell_reverse_lunge = 38,
    overhead_bulgarian_split_squat = 39,
    overhead_dumbbell_reverse_lunge = 40,
    overhead_dumbbell_split_squat = 41,
    overhead_lunge_with_rotation = 42,
    reverse_barbell_box_lunge = 43,
    reverse_box_lunge = 44,
    reverse_dumbbell_box_lunge = 45,
    reverse_dumbbell_crossover_lunge = 46,
    reverse_dumbbell_diagonal_lunge = 47,
    reverse_lunge_with_reach_back = 48,
    weighted_reverse_lunge_with_reach_back = 49,
    reverse_lunge_with_twist_and_overhead_reach = 50,
    weighted_reverse_lunge_with_twist_and_overhead_reach = 51,
    reverse_sliding_box_lunge = 52,
    weighted_reverse_sliding_box_lunge = 53,
    reverse_sliding_lunge = 54,
    weighted_reverse_sliding_lunge = 55,
    runners_lunge_to_balance = 56,
    weighted_runners_lunge_to_balance = 57,
    shifting_side_lunge = 58,
    side_and_crossover_lunge = 59,
    weighted_side_and_crossover_lunge = 60,
    side_lunge = 61,
    weighted_side_lunge = 62,
    side_lunge_and_press = 63,
    side_lunge_jump_off = 64,
    side_lunge_sweep = 65,
    weighted_side_lunge_sweep = 66,
    side_lunge_to_crossover_tap = 67,
    weighted_side_lunge_to_crossover_tap = 68,
    side_to_side_lunge_chops = 69,
    weighted_side_to_side_lunge_chops = 70,
    siff_jump_lunge = 71,
    weighted_siff_jump_lunge = 72,
    single_arm_reverse_lunge_and_press = 73,
    sliding_lateral_lunge = 74,
    weighted_sliding_lateral_lunge = 75,
    walking_barbell_lunge = 76,
    walking_dumbbell_lunge = 77,
    walking_lunge = 78,
    weighted_walking_lunge = 79,
    wide_grip_overhead_barbell_split_squat = 80,
    alternating_dumbbell_lunge = 81,
    dumbbell_reverse_lunge = 82,
    overhead_dumbbell_lunge = 83,
    scissor_power_switch = 84,
    dumbbell_overhead_walking_lunge = 85,
    curtsy_lunge = 86,
    weighted_curtsy_lunge = 87,
    weighted_shifting_side_lunge = 88,
    weighted_side_lunge_and_press = 89,
    weighted_side_lunge_jump_off = 90,
};

pub const OlympicLiftExerciseName = enum(u16) {
    barbell_hang_power_clean = 0,
    barbell_hang_squat_clean = 1,
    barbell_power_clean = 2,
    barbell_power_snatch = 3,
    barbell_squat_clean = 4,
    clean_and_jerk = 5,
    barbell_hang_power_snatch = 6,
    barbell_hang_pull = 7,
    barbell_high_pull = 8,
    barbell_snatch = 9,
    barbell_split_jerk = 10,
    clean = 11,
    dumbbell_clean = 12,
    dumbbell_hang_pull = 13,
    one_hand_dumbbell_split_snatch = 14,
    push_jerk = 15,
    single_arm_dumbbell_snatch = 16,
    single_arm_hang_snatch = 17,
    single_arm_kettlebell_snatch = 18,
    split_jerk = 19,
    squat_clean_and_jerk = 20,
    dumbbell_hang_snatch = 21,
    dumbbell_power_clean_and_jerk = 22,
    dumbbell_power_clean_and_push_press = 23,
    dumbbell_power_clean_and_strict_press = 24,
    dumbbell_snatch = 25,
    medicine_ball_clean = 26,
    clean_and_press = 27,
    snatch = 28,
};

pub const PlankExerciseName = enum(u16) {
    _45_degree_plank = 0,
    weighted_45_degree_plank = 1,
    _90_degree_static_hold = 2,
    weighted_90_degree_static_hold = 3,
    bear_crawl = 4,
    weighted_bear_crawl = 5,
    cross_body_mountain_climber = 6,
    weighted_cross_body_mountain_climber = 7,
    elbow_plank_pike_jacks = 8,
    weighted_elbow_plank_pike_jacks = 9,
    elevated_feet_plank = 10,
    weighted_elevated_feet_plank = 11,
    elevator_abs = 12,
    weighted_elevator_abs = 13,
    extended_plank = 14,
    weighted_extended_plank = 15,
    full_plank_passe_twist = 16,
    weighted_full_plank_passe_twist = 17,
    inching_elbow_plank = 18,
    weighted_inching_elbow_plank = 19,
    inchworm_to_side_plank = 20,
    weighted_inchworm_to_side_plank = 21,
    kneeling_plank = 22,
    weighted_kneeling_plank = 23,
    kneeling_side_plank_with_leg_lift = 24,
    weighted_kneeling_side_plank_with_leg_lift = 25,
    lateral_roll = 26,
    weighted_lateral_roll = 27,
    lying_reverse_plank = 28,
    weighted_lying_reverse_plank = 29,
    medicine_ball_mountain_climber = 30,
    weighted_medicine_ball_mountain_climber = 31,
    modified_mountain_climber_and_extension = 32,
    weighted_modified_mountain_climber_and_extension = 33,
    mountain_climber = 34,
    weighted_mountain_climber = 35,
    mountain_climber_on_sliding_discs = 36,
    weighted_mountain_climber_on_sliding_discs = 37,
    mountain_climber_with_feet_on_bosu_ball = 38,
    weighted_mountain_climber_with_feet_on_bosu_ball = 39,
    mountain_climber_with_hands_on_bench = 40,
    mountain_climber_with_hands_on_swiss_ball = 41,
    weighted_mountain_climber_with_hands_on_swiss_ball = 42,
    plank = 43,
    plank_jacks_with_feet_on_sliding_discs = 44,
    weighted_plank_jacks_with_feet_on_sliding_discs = 45,
    plank_knee_twist = 46,
    weighted_plank_knee_twist = 47,
    plank_pike_jumps = 48,
    weighted_plank_pike_jumps = 49,
    plank_pikes = 50,
    weighted_plank_pikes = 51,
    plank_to_stand_up = 52,
    weighted_plank_to_stand_up = 53,
    plank_with_arm_raise = 54,
    weighted_plank_with_arm_raise = 55,
    plank_with_knee_to_elbow = 56,
    weighted_plank_with_knee_to_elbow = 57,
    plank_with_oblique_crunch = 58,
    weighted_plank_with_oblique_crunch = 59,
    plyometric_side_plank = 60,
    weighted_plyometric_side_plank = 61,
    rolling_side_plank = 62,
    weighted_rolling_side_plank = 63,
    side_kick_plank = 64,
    weighted_side_kick_plank = 65,
    side_plank = 66,
    weighted_side_plank = 67,
    side_plank_and_row = 68,
    weighted_side_plank_and_row = 69,
    side_plank_lift = 70,
    weighted_side_plank_lift = 71,
    side_plank_with_elbow_on_bosu_ball = 72,
    weighted_side_plank_with_elbow_on_bosu_ball = 73,
    side_plank_with_feet_on_bench = 74,
    weighted_side_plank_with_feet_on_bench = 75,
    side_plank_with_knee_circle = 76,
    weighted_side_plank_with_knee_circle = 77,
    side_plank_with_knee_tuck = 78,
    weighted_side_plank_with_knee_tuck = 79,
    side_plank_with_leg_lift = 80,
    weighted_side_plank_with_leg_lift = 81,
    side_plank_with_reach_under = 82,
    weighted_side_plank_with_reach_under = 83,
    single_leg_elevated_feet_plank = 84,
    weighted_single_leg_elevated_feet_plank = 85,
    single_leg_flex_and_extend = 86,
    weighted_single_leg_flex_and_extend = 87,
    single_leg_side_plank = 88,
    weighted_single_leg_side_plank = 89,
    spiderman_plank = 90,
    weighted_spiderman_plank = 91,
    straight_arm_plank = 92,
    weighted_straight_arm_plank = 93,
    straight_arm_plank_with_shoulder_touch = 94,
    weighted_straight_arm_plank_with_shoulder_touch = 95,
    swiss_ball_plank = 96,
    weighted_swiss_ball_plank = 97,
    swiss_ball_plank_leg_lift = 98,
    weighted_swiss_ball_plank_leg_lift = 99,
    swiss_ball_plank_leg_lift_and_hold = 100,
    swiss_ball_plank_with_feet_on_bench = 101,
    weighted_swiss_ball_plank_with_feet_on_bench = 102,
    swiss_ball_prone_jackknife = 103,
    weighted_swiss_ball_prone_jackknife = 104,
    swiss_ball_side_plank = 105,
    weighted_swiss_ball_side_plank = 106,
    three_way_plank = 107,
    weighted_three_way_plank = 108,
    towel_plank_and_knee_in = 109,
    weighted_towel_plank_and_knee_in = 110,
    t_stabilization = 111,
    weighted_t_stabilization = 112,
    turkish_get_up_to_side_plank = 113,
    weighted_turkish_get_up_to_side_plank = 114,
    two_point_plank = 115,
    weighted_two_point_plank = 116,
    weighted_plank = 117,
    wide_stance_plank_with_diagonal_arm_lift = 118,
    weighted_wide_stance_plank_with_diagonal_arm_lift = 119,
    wide_stance_plank_with_diagonal_leg_lift = 120,
    weighted_wide_stance_plank_with_diagonal_leg_lift = 121,
    wide_stance_plank_with_leg_lift = 122,
    weighted_wide_stance_plank_with_leg_lift = 123,
    wide_stance_plank_with_opposite_arm_and_leg_lift = 124,
    weighted_mountain_climber_with_hands_on_bench = 125,
    weighted_swiss_ball_plank_leg_lift_and_hold = 126,
    weighted_wide_stance_plank_with_opposite_arm_and_leg_lift = 127,
    plank_with_feet_on_swiss_ball = 128,
    side_plank_to_plank_with_reach_under = 129,
    bridge_with_glute_lower_lift = 130,
    bridge_one_leg_bridge = 131,
    plank_with_arm_variations = 132,
    plank_with_leg_lift = 133,
    reverse_plank_with_leg_pull = 134,
    ring_plank_sprawls = 135,
};

pub const PlyoExerciseName = enum(u16) {
    alternating_jump_lunge = 0,
    weighted_alternating_jump_lunge = 1,
    barbell_jump_squat = 2,
    body_weight_jump_squat = 3,
    weighted_jump_squat = 4,
    cross_knee_strike = 5,
    weighted_cross_knee_strike = 6,
    depth_jump = 7,
    weighted_depth_jump = 8,
    dumbbell_jump_squat = 9,
    dumbbell_split_jump = 10,
    front_knee_strike = 11,
    weighted_front_knee_strike = 12,
    high_box_jump = 13,
    weighted_high_box_jump = 14,
    isometric_explosive_body_weight_jump_squat = 15,
    weighted_isometric_explosive_jump_squat = 16,
    lateral_leap_and_hop = 17,
    weighted_lateral_leap_and_hop = 18,
    lateral_plyo_squats = 19,
    weighted_lateral_plyo_squats = 20,
    lateral_slide = 21,
    weighted_lateral_slide = 22,
    medicine_ball_overhead_throws = 23,
    medicine_ball_side_throw = 24,
    medicine_ball_slam = 25,
    side_to_side_medicine_ball_throws = 26,
    side_to_side_shuffle_jump = 27,
    weighted_side_to_side_shuffle_jump = 28,
    squat_jump_onto_box = 29,
    weighted_squat_jump_onto_box = 30,
    squat_jumps_in_and_out = 31,
    weighted_squat_jumps_in_and_out = 32,
    box_jump = 33,
    box_jump_overs = 34,
    box_jump_overs_over_the_box = 35,
    star_jump_squats = 36,
    jump_squat = 37,
};

pub const PullUpExerciseName = enum(u16) {
    banded_pull_ups = 0,
    _30_degree_lat_pulldown = 1,
    band_assisted_chin_up = 2,
    close_grip_chin_up = 3,
    weighted_close_grip_chin_up = 4,
    close_grip_lat_pulldown = 5,
    crossover_chin_up = 6,
    weighted_crossover_chin_up = 7,
    ez_bar_pullover = 8,
    hanging_hurdle = 9,
    weighted_hanging_hurdle = 10,
    kneeling_lat_pulldown = 11,
    kneeling_underhand_grip_lat_pulldown = 12,
    lat_pulldown = 13,
    mixed_grip_chin_up = 14,
    weighted_mixed_grip_chin_up = 15,
    mixed_grip_pull_up = 16,
    weighted_mixed_grip_pull_up = 17,
    reverse_grip_pulldown = 18,
    standing_cable_pullover = 19,
    straight_arm_pulldown = 20,
    swiss_ball_ez_bar_pullover = 21,
    towel_pull_up = 22,
    weighted_towel_pull_up = 23,
    weighted_pull_up = 24,
    wide_grip_lat_pulldown = 25,
    wide_grip_pull_up = 26,
    weighted_wide_grip_pull_up = 27,
    burpee_pull_up = 28,
    weighted_burpee_pull_up = 29,
    jumping_pull_ups = 30,
    weighted_jumping_pull_ups = 31,
    kipping_pull_up = 32,
    weighted_kipping_pull_up = 33,
    l_pull_up = 34,
    weighted_l_pull_up = 35,
    suspended_chin_up = 36,
    weighted_suspended_chin_up = 37,
    pull_up = 38,
    chin_up = 39,
    neutral_grip_chin_up = 40,
    weighted_chin_up = 41,
    band_assisted_pull_up = 42,
    neutral_grip_pull_up = 43,
    weighted_neutral_grip_chin_up = 44,
    weighted_neutral_grip_pull_up = 45,
};

pub const PushUpExerciseName = enum(u16) {
    chest_press_with_band = 0,
    alternating_staggered_push_up = 1,
    weighted_alternating_staggered_push_up = 2,
    alternating_hands_medicine_ball_push_up = 3,
    weighted_alternating_hands_medicine_ball_push_up = 4,
    bosu_ball_push_up = 5,
    weighted_bosu_ball_push_up = 6,
    clapping_push_up = 7,
    weighted_clapping_push_up = 8,
    close_grip_medicine_ball_push_up = 9,
    weighted_close_grip_medicine_ball_push_up = 10,
    close_hands_push_up = 11,
    weighted_close_hands_push_up = 12,
    decline_push_up = 13,
    weighted_decline_push_up = 14,
    diamond_push_up = 15,
    weighted_diamond_push_up = 16,
    explosive_crossover_push_up = 17,
    weighted_explosive_crossover_push_up = 18,
    explosive_push_up = 19,
    weighted_explosive_push_up = 20,
    feet_elevated_side_to_side_push_up = 21,
    weighted_feet_elevated_side_to_side_push_up = 22,
    hand_release_push_up = 23,
    weighted_hand_release_push_up = 24,
    handstand_push_up = 25,
    weighted_handstand_push_up = 26,
    incline_push_up = 27,
    weighted_incline_push_up = 28,
    isometric_explosive_push_up = 29,
    weighted_isometric_explosive_push_up = 30,
    judo_push_up = 31,
    weighted_judo_push_up = 32,
    kneeling_push_up = 33,
    weighted_kneeling_push_up = 34,
    medicine_ball_chest_pass = 35,
    medicine_ball_push_up = 36,
    weighted_medicine_ball_push_up = 37,
    one_arm_push_up = 38,
    weighted_one_arm_push_up = 39,
    weighted_push_up = 40,
    push_up_and_row = 41,
    weighted_push_up_and_row = 42,
    push_up_plus = 43,
    weighted_push_up_plus = 44,
    push_up_with_feet_on_swiss_ball = 45,
    weighted_push_up_with_feet_on_swiss_ball = 46,
    push_up_with_one_hand_on_medicine_ball = 47,
    weighted_push_up_with_one_hand_on_medicine_ball = 48,
    shoulder_push_up = 49,
    weighted_shoulder_push_up = 50,
    single_arm_medicine_ball_push_up = 51,
    weighted_single_arm_medicine_ball_push_up = 52,
    spiderman_push_up = 53,
    weighted_spiderman_push_up = 54,
    stacked_feet_push_up = 55,
    weighted_stacked_feet_push_up = 56,
    staggered_hands_push_up = 57,
    weighted_staggered_hands_push_up = 58,
    suspended_push_up = 59,
    weighted_suspended_push_up = 60,
    swiss_ball_push_up = 61,
    weighted_swiss_ball_push_up = 62,
    swiss_ball_push_up_plus = 63,
    weighted_swiss_ball_push_up_plus = 64,
    t_push_up = 65,
    weighted_t_push_up = 66,
    triple_stop_push_up = 67,
    weighted_triple_stop_push_up = 68,
    wide_hands_push_up = 69,
    weighted_wide_hands_push_up = 70,
    parallette_handstand_push_up = 71,
    weighted_parallette_handstand_push_up = 72,
    ring_handstand_push_up = 73,
    weighted_ring_handstand_push_up = 74,
    ring_push_up = 75,
    weighted_ring_push_up = 76,
    push_up = 77,
    pilates_pushup = 78,
    dynamic_push_up = 79,
    kipping_handstand_push_up = 80,
    shoulder_tapping_push_up = 81,
    biceps_push_up = 82,
    hindu_push_up = 83,
    pike_push_up = 84,
    wide_grip_push_up = 85,
    weighted_biceps_push_up = 86,
    weighted_hindu_push_up = 87,
    weighted_pike_push_up = 88,
    kipping_parallette_handstand_push_up = 89,
    wall_push_up = 90,
};

pub const RowExerciseName = enum(u16) {
    barbell_straight_leg_deadlift_to_row = 0,
    cable_row_standing = 1,
    dumbbell_row = 2,
    elevated_feet_inverted_row = 3,
    weighted_elevated_feet_inverted_row = 4,
    face_pull = 5,
    face_pull_with_external_rotation = 6,
    inverted_row_with_feet_on_swiss_ball = 7,
    weighted_inverted_row_with_feet_on_swiss_ball = 8,
    kettlebell_row = 9,
    modified_inverted_row = 10,
    weighted_modified_inverted_row = 11,
    neutral_grip_alternating_dumbbell_row = 12,
    one_arm_bent_over_row = 13,
    one_legged_dumbbell_row = 14,
    renegade_row = 15,
    reverse_grip_barbell_row = 16,
    rope_handle_cable_row = 17,
    seated_cable_row = 18,
    seated_dumbbell_row = 19,
    single_arm_cable_row = 20,
    single_arm_cable_row_and_rotation = 21,
    single_arm_inverted_row = 22,
    weighted_single_arm_inverted_row = 23,
    single_arm_neutral_grip_dumbbell_row = 24,
    single_arm_neutral_grip_dumbbell_row_and_rotation = 25,
    suspended_inverted_row = 26,
    weighted_suspended_inverted_row = 27,
    t_bar_row = 28,
    towel_grip_inverted_row = 29,
    weighted_towel_grip_inverted_row = 30,
    underhand_grip_cable_row = 31,
    v_grip_cable_row = 32,
    wide_grip_seated_cable_row = 33,
    alternating_dumbbell_row = 34,
    inverted_row = 35,
    row = 36,
    weighted_row = 37,
    indoor_row = 38,
    banded_face_pulls = 39,
    chest_supported_dumbbell_row = 40,
    decline_ring_row = 41,
    elevated_ring_row = 42,
    rdl_bent_over_row_with_barbell_dumbbell = 43,
    ring_row = 44,
    barbell_row = 45,
    bent_over_row_with_barbell = 46,
    bent_over_row_with_dumbell = 47,
    seated_underhand_grip_cable_row = 48,
    trx_inverted_row = 49,
    weighted_inverted_row = 50,
    weighted_trx_inverted_row = 51,
    dumbbell_row_wheelchair = 52,
};

pub const ShoulderPressExerciseName = enum(u16) {
    alternating_dumbbell_shoulder_press = 0,
    arnold_press = 1,
    barbell_front_squat_to_push_press = 2,
    barbell_push_press = 3,
    barbell_shoulder_press = 4,
    dead_curl_press = 5,
    dumbbell_alternating_shoulder_press_and_twist = 6,
    dumbbell_hammer_curl_to_lunge_to_press = 7,
    dumbbell_push_press = 8,
    floor_inverted_shoulder_press = 9,
    weighted_floor_inverted_shoulder_press = 10,
    inverted_shoulder_press = 11,
    weighted_inverted_shoulder_press = 12,
    one_arm_push_press = 13,
    overhead_barbell_press = 14,
    overhead_dumbbell_press = 15,
    seated_barbell_shoulder_press = 16,
    seated_dumbbell_shoulder_press = 17,
    single_arm_dumbbell_shoulder_press = 18,
    single_arm_step_up_and_press = 19,
    smith_machine_overhead_press = 20,
    split_stance_hammer_curl_to_press = 21,
    swiss_ball_dumbbell_shoulder_press = 22,
    weight_plate_front_raise = 23,
    dumbbell_shoulder_press = 24,
    military_press = 25,
    strict_press = 27,
    dumbbell_front_raise = 28,
    dumbbell_curl_to_overhead_press_wheelchair = 29,
    arnold_press_wheelchair = 30,
    overhead_dumbbell_press_wheelchair = 31,
};

pub const ShoulderStabilityExerciseName = enum(u16) {
    _90_degree_cable_external_rotation = 0,
    band_external_rotation = 1,
    band_internal_rotation = 2,
    bent_arm_lateral_raise_and_external_rotation = 3,
    cable_external_rotation = 4,
    dumbbell_face_pull_with_external_rotation = 5,
    floor_i_raise = 6,
    weighted_floor_i_raise = 7,
    floor_t_raise = 8,
    weighted_floor_t_raise = 9,
    floor_y_raise = 10,
    weighted_floor_y_raise = 11,
    incline_i_raise = 12,
    weighted_incline_i_raise = 13,
    incline_l_raise = 14,
    weighted_incline_l_raise = 15,
    incline_t_raise = 16,
    weighted_incline_t_raise = 17,
    incline_w_raise = 18,
    weighted_incline_w_raise = 19,
    incline_y_raise = 20,
    weighted_incline_y_raise = 21,
    lying_external_rotation = 22,
    seated_dumbbell_external_rotation = 23,
    standing_l_raise = 24,
    swiss_ball_i_raise = 25,
    weighted_swiss_ball_i_raise = 26,
    swiss_ball_t_raise = 27,
    weighted_swiss_ball_t_raise = 28,
    swiss_ball_w_raise = 29,
    weighted_swiss_ball_w_raise = 30,
    swiss_ball_y_raise = 31,
    weighted_swiss_ball_y_raise = 32,
    cable_internal_rotation = 33,
    lying_internal_rotation = 34,
    seated_dumbbell_internal_rotation = 35,
};

pub const ShrugExerciseName = enum(u16) {
    barbell_jump_shrug = 0,
    barbell_shrug = 1,
    barbell_upright_row = 2,
    behind_the_back_smith_machine_shrug = 3,
    dumbbell_jump_shrug = 4,
    dumbbell_shrug = 5,
    dumbbell_upright_row = 6,
    incline_dumbbell_shrug = 7,
    overhead_barbell_shrug = 8,
    overhead_dumbbell_shrug = 9,
    scaption_and_shrug = 10,
    scapular_retraction = 11,
    serratus_chair_shrug = 12,
    weighted_serratus_chair_shrug = 13,
    serratus_shrug = 14,
    weighted_serratus_shrug = 15,
    wide_grip_jump_shrug = 16,
    wide_grip_barbell_shrug = 17,
    behind_the_back_shrug = 18,
    dumbbell_shrug_wheelchair = 19,
    shrug_wheelchair = 20,
    shrug_arm_down_wheelchair = 21,
    shrug_arm_mid_wheelchair = 22,
    shrug_arm_up_wheelchair = 23,
    upright_row = 24,
};

pub const SitUpExerciseName = enum(u16) {
    alternating_sit_up = 0,
    weighted_alternating_sit_up = 1,
    bent_knee_v_up = 2,
    weighted_bent_knee_v_up = 3,
    butterfly_sit_up = 4,
    weighted_butterfly_situp = 5,
    cross_punch_roll_up = 6,
    weighted_cross_punch_roll_up = 7,
    crossed_arms_sit_up = 8,
    weighted_crossed_arms_sit_up = 9,
    get_up_sit_up = 10,
    weighted_get_up_sit_up = 11,
    hovering_sit_up = 12,
    weighted_hovering_sit_up = 13,
    kettlebell_sit_up = 14,
    medicine_ball_alternating_v_up = 15,
    medicine_ball_sit_up = 16,
    medicine_ball_v_up = 17,
    modified_sit_up = 18,
    negative_sit_up = 19,
    one_arm_full_sit_up = 20,
    reclining_circle = 21,
    weighted_reclining_circle = 22,
    reverse_curl_up = 23,
    weighted_reverse_curl_up = 24,
    single_leg_swiss_ball_jackknife = 25,
    weighted_single_leg_swiss_ball_jackknife = 26,
    the_teaser = 27,
    the_teaser_weighted = 28,
    three_part_roll_down = 29,
    weighted_three_part_roll_down = 30,
    v_up = 31,
    weighted_v_up = 32,
    weighted_russian_twist_on_swiss_ball = 33,
    weighted_sit_up = 34,
    x_abs = 35,
    weighted_x_abs = 36,
    sit_up = 37,
    ghd_sit_ups = 38,
    sit_up_turkish_get_up = 39,
    russian_twist_on_swiss_ball = 40,
};

pub const SquatExerciseName = enum(u16) {
    leg_press = 0,
    back_squat_with_body_bar = 1,
    back_squats = 2,
    weighted_back_squats = 3,
    balancing_squat = 4,
    weighted_balancing_squat = 5,
    barbell_back_squat = 6,
    barbell_box_squat = 7,
    barbell_front_squat = 8,
    barbell_hack_squat = 9,
    barbell_hang_squat_snatch = 10,
    barbell_lateral_step_up = 11,
    barbell_quarter_squat = 12,
    barbell_siff_squat = 13,
    barbell_squat_snatch = 14,
    barbell_squat_with_heels_raised = 15,
    barbell_stepover = 16,
    barbell_step_up = 17,
    bench_squat_with_rotational_chop = 18,
    weighted_bench_squat_with_rotational_chop = 19,
    body_weight_wall_squat = 20,
    weighted_wall_squat = 21,
    box_step_squat = 22,
    weighted_box_step_squat = 23,
    braced_squat = 24,
    crossed_arm_barbell_front_squat = 25,
    crossover_dumbbell_step_up = 26,
    dumbbell_front_squat = 27,
    dumbbell_split_squat = 28,
    dumbbell_squat = 29,
    dumbbell_squat_clean = 30,
    dumbbell_stepover = 31,
    dumbbell_step_up = 32,
    elevated_single_leg_squat = 33,
    weighted_elevated_single_leg_squat = 34,
    figure_four_squats = 35,
    weighted_figure_four_squats = 36,
    goblet_squat = 37,
    kettlebell_squat = 38,
    kettlebell_swing_overhead = 39,
    kettlebell_swing_with_flip_to_squat = 40,
    lateral_dumbbell_step_up = 41,
    one_legged_squat = 42,
    overhead_dumbbell_squat = 43,
    overhead_squat = 44,
    partial_single_leg_squat = 45,
    weighted_partial_single_leg_squat = 46,
    pistol_squat = 47,
    weighted_pistol_squat = 48,
    plie_slides = 49,
    weighted_plie_slides = 50,
    plie_squat = 51,
    weighted_plie_squat = 52,
    prisoner_squat = 53,
    weighted_prisoner_squat = 54,
    single_leg_bench_get_up = 55,
    weighted_single_leg_bench_get_up = 56,
    single_leg_bench_squat = 57,
    weighted_single_leg_bench_squat = 58,
    single_leg_squat_on_swiss_ball = 59,
    weighted_single_leg_squat_on_swiss_ball = 60,
    squat = 61,
    weighted_squat = 62,
    squats_with_band = 63,
    staggered_squat = 64,
    weighted_staggered_squat = 65,
    step_up = 66,
    weighted_step_up = 67,
    suitcase_squats = 68,
    sumo_squat = 69,
    sumo_squat_slide_in = 70,
    weighted_sumo_squat_slide_in = 71,
    sumo_squat_to_high_pull = 72,
    sumo_squat_to_stand = 73,
    weighted_sumo_squat_to_stand = 74,
    sumo_squat_with_rotation = 75,
    weighted_sumo_squat_with_rotation = 76,
    swiss_ball_body_weight_wall_squat = 77,
    weighted_swiss_ball_wall_squat = 78,
    thrusters = 79,
    uneven_squat = 80,
    weighted_uneven_squat = 81,
    waist_slimming_squat = 82,
    wall_ball = 83,
    wide_stance_barbell_squat = 84,
    wide_stance_goblet_squat = 85,
    zercher_squat = 86,
    /// Deprecated do not use
    kbs_overhead = 87,
    squat_and_side_kick = 88,
    squat_jumps_in_n_out = 89,
    pilates_plie_squats_parallel_turned_out_flat_and_heels = 90,
    releve_straight_leg_and_knee_bent_with_one_leg_variation = 91,
    alternating_box_dumbbell_step_ups = 92,
    dumbbell_overhead_squat_single_arm = 93,
    dumbbell_squat_snatch = 94,
    medicine_ball_squat = 95,
    wall_ball_squat_and_press = 97,
    squat_american_swing = 98,
    air_squat = 100,
    dumbbell_thrusters = 101,
    overhead_barbell_squat = 102,
};

pub const TotalBodyExerciseName = enum(u16) {
    burpee = 0,
    weighted_burpee = 1,
    burpee_box_jump = 2,
    weighted_burpee_box_jump = 3,
    high_pull_burpee = 4,
    man_makers = 5,
    one_arm_burpee = 6,
    squat_thrusts = 7,
    weighted_squat_thrusts = 8,
    squat_plank_push_up = 9,
    weighted_squat_plank_push_up = 10,
    standing_t_rotation_balance = 11,
    weighted_standing_t_rotation_balance = 12,
    barbell_burpee = 13,
    burpee_box_jump_over_yes_literally_jumping_over_the_box = 15,
    burpee_box_jump_step_up_over = 16,
    lateral_barbell_burpee = 17,
    total_body_burpee_over_bar = 18,
    burpee_box_jump_over = 19,
    burpee_wheelchair = 20,
};

pub const MoveExerciseName = enum(u16) {
    arch_and_curl = 0,
    arm_circles_with_ball_band_and_weight = 1,
    arm_stretch = 2,
    back_massage = 3,
    belly_breathing = 4,
    bridge_with_ball = 5,
    diamond_leg_crunch = 6,
    diamond_leg_lift = 7,
    eight_point_shoulder_opener = 8,
    foot_rolling = 9,
    footwork = 10,
    footwork_on_disc = 11,
    forward_fold = 12,
    frog_with_band = 13,
    half_roll_up = 14,
    hamstring_curl = 15,
    hamstring_stretch = 16,
    hip_stretch = 17,
    hug_a_tree_with_ball_band_and_weight = 18,
    knee_circles = 19,
    knee_folds_on_disc = 20,
    lateral_flexion = 21,
    leg_stretch_with_band = 22,
    leg_stretch_with_leg_circles = 23,
    lower_lift_on_disc = 24,
    lunge_squat = 25,
    lunges_with_knee_lift = 26,
    mermaid_stretch = 27,
    neutral_pelvic_position = 28,
    pelvic_clocks_on_disc = 29,
    pilates_plie_squats_parallel_turned_out_flat_and_heels_with_chair = 30,
    piriformis_stretch = 31,
    plank_knee_crosses = 32,
    plank_knee_pulls = 33,
    plank_up_downs = 34,
    prayer_mudra = 35,
    psoas_lunge_stretch = 36,
    ribcage_breathing = 37,
    roll_down = 38,
    roll_up_with_weight_and_band = 39,
    saw = 40,
    scapular_stabilization = 41,
    scissors_on_disc = 42,
    seated_hip_stretchup = 43,
    seated_twist = 44,
    shaving_the_head_with_ball_band_and_weight = 45,
    spinal_twist = 46,
    spinal_twist_stretch = 47,
    spine_stretch_forward = 48,
    squat_open_arm_twist_pose = 49,
    squats_with_ball = 50,
    stand_and_hang = 51,
    standing_side_stretch = 52,
    standing_single_leg_forward_bend_with_it_band_opener = 53,
    straight_leg_crunch_with_leg_lift = 54,
    straight_leg_crunch_with_leg_lift_with_ball = 55,
    straight_leg_crunch_with_legs_crossed = 56,
    straight_leg_crunch_with_legs_crossed_with_ball = 57,
    straight_leg_diagonal_crunch = 58,
    straight_leg_diagonal_crunch_with_ball = 59,
    tailbone_curl = 60,
    throat_lock = 61,
    tick_tock_side_roll = 62,
    twist = 63,
    v_leg_crunches = 64,
    v_sit = 65,
    forward_fold_wheelchair = 66,
    forward_fold_plus_wheelchair = 67,
    arm_circles_low_forward_wheelchair = 68,
    arm_circles_mid_forward_wheelchair = 69,
    arm_circles_high_forward_wheelchair = 70,
    arm_circles_low_backward_wheelchair = 71,
    arm_circles_mid_backward_wheelchair = 72,
    arm_circles_high_backward_wheelchair = 73,
    core_twists_wheelchair = 74,
    arm_raise_wheelchair = 75,
    chest_expand_wheelchair = 76,
    arm_extend_wheelchair = 77,
    forward_bend_wheelchair = 78,
    toe_touch_wheelchair = 79,
    extended_toe_touch_wheelchair = 80,
    seated_arm_circles = 81,
    trunk_rotations = 82,
    seated_trunk_rotations = 83,
    toe_touch = 84,
};

pub const PoseExerciseName = enum(u16) {
    all_fours = 0,
    ankle_to_knee = 1,
    baby_cobra = 2,
    boat = 3,
    bound_angle = 4,
    bound_seated_single_leg_forward_bend = 5,
    bow = 6,
    bowed_half_moon = 7,
    bridge = 8,
    cat = 9,
    chair = 10,
    childs = 11,
    corpse = 12,
    cow_face = 13,
    cow = 14,
    devotional_warrior = 15,
    dolphin_plank = 16,
    dolphin = 17,
    down_dog_knee_to_nose = 18,
    down_dog_split = 19,
    down_dog_split_open_hip_bent_knee = 20,
    downward_facing_dog = 21,
    eagle = 22,
    easy_seated = 23,
    extended_puppy = 24,
    extended_side_angle = 25,
    fish = 26,
    four_limbed_staff = 27,
    full_split = 28,
    gate = 29,
    half_chair_half_ankle_to_knee = 30,
    half_moon = 31,
    head_to_knee = 32,
    heron = 33,
    heros = 34,
    high_lunge = 35,
    knees_chest_chin = 36,
    lizard = 37,
    locust = 38,
    low_lunge = 39,
    low_lunge_twist = 40,
    low_lunge_with_knee_down = 41,
    mermaid = 42,
    mountain = 43,
    one_legged_downward_facing_pose_open_hip_bent_knee = 44,
    one_legged_pigeon = 45,
    peaceful_warrior = 46,
    plank = 47,
    plow = 48,
    reclined_hand_to_foot = 49,
    revolved_half_moon = 50,
    revolved_head_to_knee = 51,
    revolved_triangle = 52,
    runners_lunge = 53,
    seated_easy_side_bend = 54,
    seated_easy_twist = 55,
    seated_long_leg_forward_bend = 56,
    seated_wide_leg_forward_bend = 57,
    shoulder_stand = 58,
    side_boat = 59,
    side_plank = 60,
    sphinx = 61,
    squat_open_arm_twist = 62,
    squat_palm_press = 63,
    staff = 64,
    standing_arms_up = 65,
    standing_forward_bend_halfway_up = 66,
    standing_forward_bend = 67,
    standing_side_opener = 68,
    standing_single_leg_forward_bend = 69,
    standing_split = 70,
    standing_wide_leg_forward_bend = 71,
    standing_wide_leg_forward_bend_with_twist = 72,
    supine_spinal_twist = 73,
    table_top = 74,
    thread_the_needle = 75,
    thunderbolt = 76,
    thunderbolt_pose_both_sides_arm_stretch = 77,
    tree = 78,
    triangle = 79,
    up_dog = 80,
    upward_facing_plank = 81,
    warrior_one = 82,
    warrior_three = 83,
    warrior_two = 84,
    wheel = 85,
    wide_side_lunge = 86,
    deep_breathing_wheelchair = 87,
    deep_breathing_low_wheelchair = 88,
    deep_breathing_mid_wheelchair = 89,
    deep_breathing_high_wheelchair = 90,
    prayer_wheelchair = 91,
    overhead_prayer_wheelchair = 92,
    cactus_wheelchair = 93,
    breathing_punches_wheelchair = 94,
    breathing_punches_extended_wheelchair = 95,
    breathing_punches_overhead_wheelchair = 96,
    breathing_punches_overhead_and_down_wheelchair = 97,
    breathing_punches_side_wheelchair = 98,
    breathing_punches_extended_side_wheelchair = 99,
    breathing_punches_overhead_side_wheelchair = 100,
    breathing_punches_overhead_and_down_side_wheelchair = 101,
    left_hand_back_wheelchair = 102,
    triangle_wheelchair = 103,
    thread_the_needle_wheelchair = 104,
    neck_flexion_and_extension_wheelchair = 105,
    neck_lateral_flexion_wheelchair = 106,
    spine_flexion_and_extension_wheelchair = 107,
    spine_rotation_wheelchair = 108,
    spine_lateral_flexion_wheelchair = 109,
    alternative_skiing_wheelchair = 110,
    reach_forward_wheelchair = 111,
    warrior_wheelchair = 112,
    reverse_warrior_wheelchair = 113,
    downward_facing_dog_to_cobra = 114,
    seated_cat_cow = 115,
};

pub const TricepsExtensionExerciseName = enum(u16) {
    bench_dip = 0,
    weighted_bench_dip = 1,
    body_weight_dip = 2,
    cable_kickback = 3,
    cable_lying_triceps_extension = 4,
    cable_overhead_triceps_extension = 5,
    dumbbell_kickback = 6,
    dumbbell_lying_triceps_extension = 7,
    ez_bar_overhead_triceps_extension = 8,
    incline_dip = 9,
    weighted_incline_dip = 10,
    incline_ez_bar_lying_triceps_extension = 11,
    lying_dumbbell_pullover_to_extension = 12,
    lying_ez_bar_triceps_extension = 13,
    lying_triceps_extension_to_close_grip_bench_press = 14,
    overhead_dumbbell_triceps_extension = 15,
    reclining_triceps_press = 16,
    reverse_grip_pressdown = 17,
    reverse_grip_triceps_pressdown = 18,
    rope_pressdown = 19,
    seated_barbell_overhead_triceps_extension = 20,
    seated_dumbbell_overhead_triceps_extension = 21,
    seated_ez_bar_overhead_triceps_extension = 22,
    seated_single_arm_overhead_dumbbell_extension = 23,
    single_arm_dumbbell_overhead_triceps_extension = 24,
    single_dumbbell_seated_overhead_triceps_extension = 25,
    single_leg_bench_dip_and_kick = 26,
    weighted_single_leg_bench_dip_and_kick = 27,
    single_leg_dip = 28,
    weighted_single_leg_dip = 29,
    static_lying_triceps_extension = 30,
    suspended_dip = 31,
    weighted_suspended_dip = 32,
    swiss_ball_dumbbell_lying_triceps_extension = 33,
    swiss_ball_ez_bar_lying_triceps_extension = 34,
    swiss_ball_ez_bar_overhead_triceps_extension = 35,
    tabletop_dip = 36,
    weighted_tabletop_dip = 37,
    triceps_extension_on_floor = 38,
    triceps_pressdown = 39,
    weighted_dip = 40,
    alternating_dumbbell_lying_triceps_extension = 41,
    triceps_press = 42,
    dumbbell_kickback_wheelchair = 43,
    overhead_dumbbell_triceps_extension_wheelchair = 44,
};

pub const WarmUpExerciseName = enum(u16) {
    quadruped_rocking = 0,
    neck_tilts = 1,
    ankle_circles = 2,
    ankle_dorsiflexion_with_band = 3,
    ankle_internal_rotation = 4,
    arm_circles = 5,
    bent_over_reach_to_sky = 6,
    cat_camel = 7,
    elbow_to_foot_lunge = 8,
    forward_and_backward_leg_swings = 9,
    groiners = 10,
    inverted_hamstring_stretch = 11,
    lateral_duck_under = 12,
    neck_rotations = 13,
    opposite_arm_and_leg_balance = 14,
    reach_roll_and_lift = 15,
    /// Deprecated do not use
    scorpion = 16,
    shoulder_circles = 17,
    side_to_side_leg_swings = 18,
    sleeper_stretch = 19,
    slide_out = 20,
    swiss_ball_hip_crossover = 21,
    swiss_ball_reach_roll_and_lift = 22,
    swiss_ball_windshield_wipers = 23,
    thoracic_rotation = 24,
    walking_high_kicks = 25,
    walking_high_knees = 26,
    walking_knee_hugs = 27,
    walking_leg_cradles = 28,
    walkout = 29,
    walkout_from_push_up_position = 30,
    biceps_stretch = 31,
    glutes_stretch = 32,
    standing_hamstring_stretch = 33,
    stretch_90_90 = 34,
    stretch_abs = 35,
    stretch_butterfly = 36,
    stretch_calf = 37,
    stretch_cat_cow = 38,
    stretch_childs_pose = 39,
    stretch_cobra = 40,
    stretch_forearms = 41,
    stretch_forward_glutes = 42,
    stretch_front_split = 43,
    stretch_hamstring = 44,
    stretch_hip_flexor_and_quad = 45,
    stretch_lat = 46,
    stretch_levator_scapulae = 47,
    stretch_lunge_with_spinal_twist = 48,
    stretch_lunging_hip_flexor = 49,
    stretch_lying_abduction = 50,
    stretch_lying_it_band = 51,
    stretch_lying_knee_to_chest = 52,
    stretch_lying_piriformis = 53,
    stretch_lying_spinal_twist = 54,
    stretch_neck = 55,
    stretch_obliques = 56,
    stretch_over_under_shoulder = 57,
    stretch_pectoral = 58,
    stretch_pigeon_pose = 59,
    stretch_piriformis = 60,
    stretch_quad = 61,
    stretch_scorpion = 62,
    stretch_shoulder = 63,
    stretch_side = 64,
    stretch_side_lunge = 65,
    stretch_side_split = 66,
    stretch_standing_it_band = 67,
    stretch_straddle = 68,
    stretch_triceps = 69,
    stretch_wall_chest_and_shoulder = 70,
    neck_rotations_wheelchair = 71,
    half_kneeling_arm_rotation = 72,
    three_way_ankle_mobilization = 73,
    /// 90_90_hip_switch
    ninety_ninety_hip_switch = 74,
    active_frog = 75,
    shoulder_sweeps = 76,
    ankle_lunges = 77,
    back_roll_foam_roller = 78,
    bear_crawl = 79,
    latissimus_dorsi_foam_roll = 80,
    reverse_t_hip_opener = 81,
    shoulder_rolls = 82,
    chest_openers = 83,
    triceps_stretch = 84,
    upper_back_stretch = 85,
    hip_circles = 86,
    ankle_stretch = 87,
    marching_in_place = 88,
    triceps_stretch_wheelchair = 89,
    upper_back_stretch_wheelchair = 90,
};

pub const RunExerciseName = enum(u16) {
    run = 0,
    walk = 1,
    jog = 2,
    sprint = 3,
    run_or_walk = 4,
    speed_walk = 5,
    warm_up = 6,
};

pub const BikeExerciseName = enum(u16) {
    bike = 0,
    ride = 1,
    sprint = 2,
};

pub const BandedExercisesExerciseName = enum(u16) {
    ab_twist = 1,
    back_extension = 2,
    bicycle_crunch = 3,
    calf_raises = 4,
    chest_press = 5,
    clam_shells = 6,
    curl = 7,
    deadbug = 8,
    deadlift = 9,
    donkey_kick = 10,
    external_rotation = 11,
    external_rotation_at_90_degree_abduction = 12,
    face_pull = 13,
    fire_hydrant = 14,
    fly = 15,
    front_raise = 16,
    glute_bridge = 17,
    hamstring_curls = 18,
    high_plank_leg_lifts = 19,
    hip_extension = 20,
    internal_rotation = 21,
    jumping_jack = 22,
    kneeling_crunch = 23,
    lateral_band_walks = 24,
    lateral_raise = 25,
    latpull = 26,
    leg_abduction = 27,
    leg_adduction = 28,
    leg_extension = 29,
    lunge = 30,
    plank = 31,
    pull_apart = 32,
    push_ups = 33,
    reverse_crunch = 34,
    row = 35,
    shoulder_abduction = 36,
    shoulder_extension = 37,
    shoulder_external_rotation = 38,
    shoulder_flexion_to_90_degrees = 39,
    side_plank_leg_lifts = 40,
    side_raise = 41,
    squat = 42,
    squat_to_press = 43,
    tricep_extension = 44,
    tricep_kickback = 45,
    upright_row = 46,
    wall_crawl_with_external_rotation = 47,
    lateral_raise_wheelchair = 49,
    triceps_extension_wheelchair = 50,
    chest_fly_incline_wheelchair = 51,
    chest_fly_decline_wheelchair = 52,
    pull_down_wheelchair = 53,
    straight_arm_pull_down_wheelchair = 54,
    curl_wheelchair = 55,
    overhead_curl_wheelchair = 56,
    face_pull_wheelchair = 57,
    around_the_world_wheelchair = 58,
    pull_apart_wheelchair = 59,
    side_curl_wheelchair = 60,
    overhead_press_wheelchair = 61,
};

pub const BattleRopeExerciseName = enum(u16) {
    alternating_figure_eight = 0,
    alternating_jump_wave = 1,
    alternating_kneeling_to_standing_wave = 2,
    alternating_lunge_wave = 3,
    alternating_squat_wave = 4,
    alternating_wave = 5,
    alternating_wave_with_lateral_shuffle = 6,
    clap_wave = 7,
    double_arm_figure_eight = 8,
    double_arm_side_to_side_snake = 9,
    double_arm_side_wave = 10,
    double_arm_slam = 11,
    double_arm_wave = 12,
    grappler_toss = 13,
    hip_toss = 14,
    in_and_out_wave = 15,
    inside_circle = 16,
    jumping_jacks = 17,
    outside_circle = 18,
    rainbow = 19,
    side_plank_wave = 20,
    sidewinder = 21,
    sitting_russian_twist = 22,
    snake_wave = 23,
    split_jack = 24,
    stage_coach = 25,
    ultimate_warrior = 26,
    upper_cuts = 27,
};

pub const EllipticalExerciseName = enum(u16) {
    elliptical = 0,
};

pub const FloorClimbExerciseName = enum(u16) {
    floor_climb = 0,
};

pub const IndoorBikeExerciseName = enum(u16) {
    air_bike = 0,
    assault_bike = 1,
    stationary_bike = 3,
};

pub const IndoorRowExerciseName = enum(u16) {
    rowing_machine = 0,
};

pub const LadderExerciseName = enum(u16) {
    agility = 0,
    speed = 1,
};

pub const SandbagExerciseName = enum(u16) {
    around_the_world = 0,
    back_squat = 1,
    bear_crawl_pull_through = 2,
    bear_hug_squat = 3,
    clean = 4,
    clean_and_press = 5,
    curl = 6,
    front_carry = 7,
    front_squat = 8,
    lunge = 9,
    overhead_press = 10,
    plank_pull_through = 11,
    rotational_lunge = 12,
    row = 13,
    russian_twist = 14,
    shouldering = 15,
    shoveling = 16,
    side_lunge = 17,
    sprint = 18,
    zercher_squat = 19,
};

pub const SledExerciseName = enum(u16) {
    backward_drag = 0,
    chest_press = 1,
    forward_drag = 2,
    low_push = 3,
    push = 4,
    row = 5,
};

pub const SledgeHammerExerciseName = enum(u16) {
    lateral_swing = 0,
    hammer_slam = 1,
};

pub const StairStepperExerciseName = enum(u16) {
    stair_stepper = 0,
};

pub const SuspensionExerciseName = enum(u16) {
    chest_fly = 0,
    chest_press = 1,
    crunch = 2,
    curl = 3,
    dip = 4,
    face_pull = 5,
    glute_bridge = 6,
    hamstring_curl = 7,
    hip_drop = 8,
    inverted_row = 9,
    knee_drive_jump = 10,
    knee_to_chest = 11,
    lat_pullover = 12,
    lunge = 13,
    mountain_climber = 14,
    pendulum = 15,
    pike = 16,
    plank = 17,
    power_pull = 18,
    pull_up = 19,
    push_up = 20,
    reverse_mountain_climber = 21,
    reverse_plank = 22,
    rollout = 23,
    row = 24,
    side_lunge = 25,
    side_plank = 26,
    single_leg_deadlift = 27,
    single_leg_squat = 28,
    sit_up = 29,
    split = 30,
    squat = 31,
    squat_jump = 32,
    tricep_press = 33,
    y_fly = 34,
};

pub const TireExerciseName = enum(u16) {
    flip = 0,
};

pub const BikeOutdoorExerciseName = enum(u16) {
    bike = 0,
};

pub const RunIndoorExerciseName = enum(u16) {
    indoor_track_run = 0,
    treadmill = 1,
};

pub const WaterType = enum(u8) {
    fresh = 0,
    salt = 1,
    en13319 = 2,
    custom = 3,
};

pub const TissueModelType = enum(u8) {
    /// Buhlmann's decompression algorithm, version C
    zhl_16c = 0,
};

pub const DiveGasStatus = enum(u8) {
    disabled = 0,
    enabled = 1,
    backup_only = 2,
};

pub const DiveAlert = enum(u8) {
    ndl_reached = 0,
    gas_switch_prompted = 1,
    near_surface = 2,
    approaching_ndl = 3,
    po2_warn = 4,
    po2_crit_high = 5,
    po2_crit_low = 6,
    time_alert = 7,
    depth_alert = 8,
    deco_ceiling_broken = 9,
    deco_complete = 10,
    safety_stop_broken = 11,
    safety_stop_complete = 12,
    cns_warning = 13,
    cns_critical = 14,
    otu_warning = 15,
    otu_critical = 16,
    ascent_critical = 17,
    alert_dismissed_by_key = 18,
    alert_dismissed_by_timeout = 19,
    battery_low = 20,
    battery_critical = 21,
    safety_stop_started = 22,
    approaching_first_deco_stop = 23,
    setpoint_switch_auto_low = 24,
    setpoint_switch_auto_high = 25,
    setpoint_switch_manual_low = 26,
    setpoint_switch_manual_high = 27,
    auto_setpoint_switch_ignored = 28,
    switched_to_open_circuit = 29,
    switched_to_closed_circuit = 30,
    tank_battery_low = 32,
    /// ccr diluent has low po2
    po2_ccr_dil_low = 33,
    /// a deco stop has been cleared
    deco_stop_cleared = 34,
    /// Target Depth Apnea Alarm triggered
    apnea_neutral_buoyancy = 35,
    /// Neutral Buoyance Apnea Alarm triggered
    apnea_target_depth = 36,
    /// Surface Apnea Alarm triggered
    apnea_surface = 37,
    /// High Speed Apnea Alarm triggered
    apnea_high_speed = 38,
    /// Low Speed Apnea Alarm triggered
    apnea_low_speed = 39,
};

pub const DiveAlarmType = enum(u8) {
    /// Alarm when a certain depth is crossed
    depth = 0,
    /// Alarm when a certain time has transpired
    time = 1,
    /// Alarm when a certain ascent or descent rate is exceeded
    speed = 2,
};

pub const DiveBacklightMode = enum(u8) {
    at_depth = 0,
    always_on = 1,
};

pub const SleepLevel = enum(u8) {
    unmeasurable = 0,
    awake = 1,
    light = 2,
    deep = 3,
    rem = 4,
};

pub const Spo2MeasurementType = enum(u8) {
    off_wrist = 0,
    spot_check = 1,
    continuous_check = 2,
    periodic = 3,
};

pub const CcrSetpointSwitchMode = enum(u8) {
    /// User switches setpoints manually
    manual = 0,
    /// Switch automatically based on depth
    automatic = 1,
};

pub const DiveGasMode = enum(u8) {
    open_circuit = 0,
    closed_circuit_diluent = 1,
};

pub const ProjectileType = enum(u8) {
    /// Arrow projectile type
    arrow = 0,
    /// Rifle cartridge projectile type
    rifle_cartridge = 1,
    /// Pistol cartridge projectile type
    pistol_cartridge = 2,
    /// Shotshell projectile type
    shotshell = 3,
    /// Air rifle pellet projectile type
    air_rifle_pellet = 4,
    /// Other projectile type
    other = 5,
};

pub const FaveroProduct = enum(u16) {
    assioma_uno = 10,
    assioma_duo = 12,
};

pub const SplitType = enum(u8) {
    ascent_split = 1,
    descent_split = 2,
    interval_active = 3,
    interval_rest = 4,
    interval_warmup = 5,
    interval_cooldown = 6,
    interval_recovery = 7,
    interval_other = 8,
    climb_active = 9,
    climb_rest = 10,
    surf_active = 11,
    run_active = 12,
    run_rest = 13,
    workout_round = 14,
    /// run/walk detection running
    rwd_run = 17,
    /// run/walk detection walking
    rwd_walk = 18,
    windsurf_active = 21,
    /// run/walk detection standing
    rwd_stand = 22,
    /// Marks the time going from ascent_split to descent_split/used in backcountry ski
    transition = 23,
    ski_lift_split = 28,
    ski_run_split = 29,
};

pub const ClimbProEvent = enum(u8) {
    approach = 0,
    start = 1,
    complete = 2,
};

pub const GasConsumptionRateType = enum(u8) {
    /// Pressure-based Surface Air Consumption
    pressure_sac = 0,
    /// Volumetric Surface Air Consumption
    volume_sac = 1,
    /// Respiratory Minute Volume
    rmv = 2,
};

pub const TapSensitivity = enum(u8) {
    high = 0,
    medium = 1,
    low = 2,
};

pub const RadarThreatLevelType = enum(u8) {
    threat_unknown = 0,
    threat_none = 1,
    threat_approaching = 2,
    threat_approaching_fast = 3,
};

pub const SleepDisruptionSeverity = enum(u8) {
    none = 0,
    low = 1,
    medium = 2,
    high = 3,
};

pub const NapPeriodFeedback = enum(u8) {
    none = 0,
    multiple_naps_during_day = 1,
    jetlag_ideal_timing_ideal_duration = 2,
    jetlag_ideal_timing_long_duration = 3,
    jetlag_late_timing_ideal_duration = 4,
    jetlag_late_timing_long_duration = 5,
    ideal_timing_ideal_duration_low_need = 6,
    ideal_timing_ideal_duration_high_need = 7,
    ideal_timing_long_duration_low_need = 8,
    ideal_timing_long_duration_high_need = 9,
    late_timing_ideal_duration_low_need = 10,
    late_timing_ideal_duration_high_need = 11,
    late_timing_long_duration_low_need = 12,
    late_timing_long_duration_high_need = 13,
    ideal_duration_low_need = 14,
    ideal_duration_high_need = 15,
    long_duration_low_need = 16,
    long_duration_high_need = 17,
};

pub const NapSource = enum(u8) {
    automatic = 0,
    manual_device = 1,
    manual_gc = 2,
};

pub const MaxMetSpeedSource = enum(u8) {
    onboard_gps = 0,
    connected_gps = 1,
    cadence = 2,
};

pub const MaxMetHeartRateSource = enum(u8) {
    /// Wrist Heart Rate Monitor
    whr = 0,
    /// Chest Strap Heart Rate Monitor
    hrm = 1,
};

pub const HrvStatus = enum(u8) {
    none = 0,
    poor = 1,
    low = 2,
    unbalanced = 3,
    balanced = 4,
};

pub const NoFlyTimeMode = enum(u8) {
    /// Standard Diver Alert Network no-fly guidance
    standard = 0,
    /// Flat 24 hour no-fly guidance
    flat_24_hours = 1,
};

/// Must be first message in file.
pub const FileIdMessage = struct {
    type: ?File = null,
    manufacturer: ?Manufacturer = null,
    serial_number: ?u32 = null,
    /// Only set for files that are can be created/erased.
    time_created: ?u32 = null,
    /// Only set for files that are not created/erased.
    number: ?u16 = null,
    /// Optional free form string to indicate the devices name or model
    product_name: ?[:0]u8 = null,

    pub fn fromRawFields(msg: *FileIdMessage, raw_fields: []const decoder.FieldData, allocator: std.mem.Allocator) !void {
        msg.* = .{};
        for (raw_fields) |rf| {
            switch (rf.id) {
                0 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.type = @enumFromInt(rf.raw_value.scalar.enumeration);
                },
                1 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.manufacturer = @enumFromInt(rf.raw_value.scalar.uint16);
                },
                3 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32z);
                    msg.*.serial_number = rf.raw_value.scalar.uint32z;
                },
                4 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.time_created = rf.raw_value.scalar.uint32;
                },
                5 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.number = rf.raw_value.scalar.uint16;
                },
                8 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .string);
                    msg.*.product_name = try allocator.dupeSentinel(u8, rf.raw_value.scalar.string, 0);
                },
                else => {},
            }
        }
    }

    pub fn deinit(msg: FileIdMessage, allocator: std.mem.Allocator) void {
        if (msg.product_name != null and msg.product_name.?.len > 0) {
            allocator.free(msg.product_name.?);
        }
    }
};

pub const FileCreatorMessage = struct {
    software_version: ?u16 = null,
    hardware_version: ?u8 = null,

    pub fn fromRawFields(msg: *FileCreatorMessage, raw_fields: []const decoder.FieldData) !void {
        msg.* = .{};
        for (raw_fields) |rf| {
            switch (rf.id) {
                0 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.software_version = rf.raw_value.scalar.uint16;
                },
                1 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.hardware_version = rf.raw_value.scalar.uint8;
                },
                else => {},
            }
        }
    }
};

pub const TimestampCorrelationMessage = struct {
    /// Whole second part of UTC timestamp at the time the system timestamp was recorded.
    timestamp: ?u32 = null,
    /// Fractional part of the UTC timestamp at the time the system timestamp was recorded.
    fractional_timestamp: ?f32 = null,
    /// Whole second part of the system timestamp
    system_timestamp: ?u32 = null,
    /// Fractional part of the system timestamp
    fractional_system_timestamp: ?f32 = null,
    /// timestamp epoch expressed in local time used to convert timestamps to local time
    local_timestamp: ?u32 = null,
    /// Millisecond part of the UTC timestamp at the time the system timestamp was recorded.
    timestamp_ms: ?u16 = null,
    /// Millisecond part of the system timestamp
    system_timestamp_ms: ?u16 = null,

    pub fn fromRawFields(msg: *TimestampCorrelationMessage, raw_fields: []const decoder.FieldData) !void {
        msg.* = .{};
        for (raw_fields) |rf| {
            switch (rf.id) {
                253 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.timestamp = rf.raw_value.scalar.uint32;
                },
                0 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint16);
                    msg.*.fractional_timestamp = (f / 32768) - 0;
                },
                1 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.system_timestamp = rf.raw_value.scalar.uint32;
                },
                2 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint16);
                    msg.*.fractional_system_timestamp = (f / 32768) - 0;
                },
                3 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.local_timestamp = rf.raw_value.scalar.uint32;
                },
                4 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.timestamp_ms = rf.raw_value.scalar.uint16;
                },
                5 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.system_timestamp_ms = rf.raw_value.scalar.uint16;
                },
                else => {},
            }
        }
    }
};

pub const SoftwareMessage = struct {
    message_index: ?MessageIndex = null,
    version: ?f32 = null,
    part_number: ?[:0]u8 = null,

    pub fn fromRawFields(msg: *SoftwareMessage, raw_fields: []const decoder.FieldData, allocator: std.mem.Allocator) !void {
        msg.* = .{};
        for (raw_fields) |rf| {
            switch (rf.id) {
                254 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.message_index = @enumFromInt(rf.raw_value.scalar.uint16);
                },
                3 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint16);
                    msg.*.version = (f / 100) - 0;
                },
                5 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .string);
                    msg.*.part_number = try allocator.dupeSentinel(u8, rf.raw_value.scalar.string, 0);
                },
                else => {},
            }
        }
    }

    pub fn deinit(msg: SoftwareMessage, allocator: std.mem.Allocator) void {
        if (msg.part_number != null and msg.part_number.?.len > 0) {
            allocator.free(msg.part_number.?);
        }
    }
};

pub const SlaveDeviceMessage = struct {
    manufacturer: ?Manufacturer = null,

    pub fn fromRawFields(msg: *SlaveDeviceMessage, raw_fields: []const decoder.FieldData) !void {
        msg.* = .{};
        for (raw_fields) |rf| {
            switch (rf.id) {
                0 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.manufacturer = @enumFromInt(rf.raw_value.scalar.uint16);
                },
                else => {},
            }
        }
    }
};

pub const CapabilitiesMessage = struct {
    /// Use language_bits_x types where x is index of array.
    languages: ?[]u8 = null,
    /// Use sport_bits_x types where x is index of array.
    sports: ?[]SportBits0 = null,
    workouts_supported: ?WorkoutCapabilities = null,
    connectivity_supported: ?ConnectivityCapabilities = null,

    pub fn fromRawFields(msg: *CapabilitiesMessage, raw_fields: []const decoder.FieldData, allocator: std.mem.Allocator) !void {
        msg.* = .{};
        for (raw_fields) |rf| {
            switch (rf.id) {
                0 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8z);
                    msg.*.languages = try allocator.alloc(u8, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        msg.*.languages[i] = raw_value.uint8z;
                    }
                },
                1 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8z);
                    msg.*.sports = try allocator.alloc(SportBits0, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        msg.*.sports[i] = raw_value.uint8z;
                    }
                },
                21 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32z);
                    msg.*.workouts_supported = @enumFromInt(rf.raw_value.scalar.uint32z);
                },
                23 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32z);
                    msg.*.connectivity_supported = @enumFromInt(rf.raw_value.scalar.uint32z);
                },
                else => {},
            }
        }
    }

    pub fn deinit(msg: CapabilitiesMessage, allocator: std.mem.Allocator) void {
        if (msg.languages != null and msg.languages.?.len > 0) {
            allocator.free(msg.languages.?);
        }
        if (msg.sports != null and msg.sports.?.len > 0) {
            allocator.free(msg.sports.?);
        }
    }
};

pub const FileCapabilitiesMessage = struct {
    message_index: ?MessageIndex = null,
    type: ?File = null,
    flags: ?FileFlags = null,
    directory: ?[:0]u8 = null,
    max_count: ?u16 = null,
    max_size: ?u32 = null,

    pub fn fromRawFields(msg: *FileCapabilitiesMessage, raw_fields: []const decoder.FieldData, allocator: std.mem.Allocator) !void {
        msg.* = .{};
        for (raw_fields) |rf| {
            switch (rf.id) {
                254 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.message_index = @enumFromInt(rf.raw_value.scalar.uint16);
                },
                0 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.type = @enumFromInt(rf.raw_value.scalar.enumeration);
                },
                1 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8z);
                    msg.*.flags = @enumFromInt(rf.raw_value.scalar.uint8z);
                },
                2 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .string);
                    msg.*.directory = try allocator.dupeSentinel(u8, rf.raw_value.scalar.string, 0);
                },
                3 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.max_count = rf.raw_value.scalar.uint16;
                },
                4 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.max_size = rf.raw_value.scalar.uint32;
                },
                else => {},
            }
        }
    }

    pub fn deinit(msg: FileCapabilitiesMessage, allocator: std.mem.Allocator) void {
        if (msg.directory != null and msg.directory.?.len > 0) {
            allocator.free(msg.directory.?);
        }
    }
};

pub const MesgCapabilitiesMessage = struct {
    message_index: ?MessageIndex = null,
    file: ?File = null,
    mesg_num: ?MesgNum = null,
    count_type: ?MesgCount = null,

    pub fn fromRawFields(msg: *MesgCapabilitiesMessage, raw_fields: []const decoder.FieldData) !void {
        msg.* = .{};
        for (raw_fields) |rf| {
            switch (rf.id) {
                254 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.message_index = @enumFromInt(rf.raw_value.scalar.uint16);
                },
                0 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.file = @enumFromInt(rf.raw_value.scalar.enumeration);
                },
                1 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.mesg_num = @enumFromInt(rf.raw_value.scalar.uint16);
                },
                2 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.count_type = @enumFromInt(rf.raw_value.scalar.enumeration);
                },
                else => {},
            }
        }
    }
};

pub const FieldCapabilitiesMessage = struct {
    message_index: ?MessageIndex = null,
    file: ?File = null,
    mesg_num: ?MesgNum = null,
    field_num: ?u8 = null,
    count: ?u16 = null,

    pub fn fromRawFields(msg: *FieldCapabilitiesMessage, raw_fields: []const decoder.FieldData) !void {
        msg.* = .{};
        for (raw_fields) |rf| {
            switch (rf.id) {
                254 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.message_index = @enumFromInt(rf.raw_value.scalar.uint16);
                },
                0 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.file = @enumFromInt(rf.raw_value.scalar.enumeration);
                },
                1 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.mesg_num = @enumFromInt(rf.raw_value.scalar.uint16);
                },
                2 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.field_num = rf.raw_value.scalar.uint8;
                },
                3 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.count = rf.raw_value.scalar.uint16;
                },
                else => {},
            }
        }
    }
};

pub const DeviceSettingsMessage = struct {
    /// Index into time zone arrays.
    active_time_zone: ?u8 = null,
    /// Offset from system time. Required to convert timestamp from system time to UTC.
    utc_offset: ?u32 = null,
    /// Offset from system time.
    time_offset: ?[]u32 = null,
    /// Display mode for the time
    time_mode: ?[]TimeMode = null,
    /// timezone offset in 1/4 hour increments
    time_zone_offset: ?[]f32 = null,
    /// Mode for backlight
    backlight_mode: ?BacklightMode = null,
    /// Enabled state of the activity tracker functionality
    activity_tracker_enabled: ?bool = null,
    /// UTC timestamp used to set the devices clock and date
    clock_time: ?u32 = null,
    /// Bitfield to configure enabled screens for each supported loop
    pages_enabled: ?[]u16 = null,
    /// Enabled state of the move alert
    move_alert_enabled: ?bool = null,
    /// Display mode for the date
    date_mode: ?DateMode = null,
    display_orientation: ?DisplayOrientation = null,
    mounting_side: ?Side = null,
    /// Bitfield to indicate one page as default for each supported loop
    default_page: ?[]u16 = null,
    /// Minimum steps before an autosync can occur
    autosync_min_steps: ?u16 = null,
    /// Minimum minutes before an autosync can occur
    autosync_min_time: ?u16 = null,
    /// Enable auto-detect setting for the lactate threshold feature.
    lactate_threshold_autodetect_enabled: ?bool = null,
    /// Automatically upload using BLE
    ble_auto_upload_enabled: ?bool = null,
    /// Helps to conserve battery by changing modes
    auto_sync_frequency: ?AutoSyncFrequency = null,
    /// Allows setting specific activities auto-activity detect enabled/disabled settings
    auto_activity_detect: ?AutoActivityDetect = null,
    /// Number of screens configured to display
    number_of_screens: ?u8 = null,
    /// Smart Notification display orientation
    smart_notification_display_orientation: ?DisplayOrientation = null,
    tap_interface: ?Switch = null,
    /// Used to hold the tap threshold setting
    tap_sensitivity: ?TapSensitivity = null,

    pub fn fromRawFields(msg: *DeviceSettingsMessage, raw_fields: []const decoder.FieldData, allocator: std.mem.Allocator) !void {
        msg.* = .{};
        for (raw_fields) |rf| {
            switch (rf.id) {
                0 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.active_time_zone = rf.raw_value.scalar.uint8;
                },
                1 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.utc_offset = rf.raw_value.scalar.uint32;
                },
                2 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.time_offset = try allocator.alloc(u32, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        msg.*.time_offset[i] = raw_value.uint32;
                    }
                },
                4 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.time_mode = try allocator.alloc(TimeMode, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        msg.*.time_mode[i] = raw_value.enumeration;
                    }
                },
                5 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .sint8);
                    msg.*.time_zone_offset = try allocator.alloc(f32, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        const f: f32 = @floatFromInt(raw_value.sint8);
                        msg.*.time_zone_offset.?[i] = (f / 4) - 0;
                    }
                },
                12 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.backlight_mode = @enumFromInt(rf.raw_value.scalar.enumeration);
                },
                39 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.clock_time = rf.raw_value.scalar.uint32;
                },
                40 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.pages_enabled = try allocator.alloc(u16, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        msg.*.pages_enabled[i] = raw_value.uint16;
                    }
                },
                47 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.date_mode = @enumFromInt(rf.raw_value.scalar.enumeration);
                },
                55 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.display_orientation = @enumFromInt(rf.raw_value.scalar.enumeration);
                },
                56 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.mounting_side = @enumFromInt(rf.raw_value.scalar.enumeration);
                },
                57 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.default_page = try allocator.alloc(u16, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        msg.*.default_page[i] = raw_value.uint16;
                    }
                },
                58 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.autosync_min_steps = rf.raw_value.scalar.uint16;
                },
                59 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.autosync_min_time = rf.raw_value.scalar.uint16;
                },
                89 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.auto_sync_frequency = @enumFromInt(rf.raw_value.scalar.enumeration);
                },
                90 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.auto_activity_detect = @enumFromInt(rf.raw_value.scalar.uint32);
                },
                94 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.number_of_screens = rf.raw_value.scalar.uint8;
                },
                95 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.smart_notification_display_orientation = @enumFromInt(rf.raw_value.scalar.enumeration);
                },
                134 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.tap_interface = @enumFromInt(rf.raw_value.scalar.enumeration);
                },
                174 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.tap_sensitivity = @enumFromInt(rf.raw_value.scalar.enumeration);
                },
                else => {},
            }
        }
    }

    pub fn deinit(msg: DeviceSettingsMessage, allocator: std.mem.Allocator) void {
        if (msg.time_offset != null and msg.time_offset.?.len > 0) {
            allocator.free(msg.time_offset.?);
        }
        if (msg.time_mode != null and msg.time_mode.?.len > 0) {
            allocator.free(msg.time_mode.?);
        }
        if (msg.time_zone_offset != null and msg.time_zone_offset.?.len > 0) {
            allocator.free(msg.time_zone_offset.?);
        }
        if (msg.pages_enabled != null and msg.pages_enabled.?.len > 0) {
            allocator.free(msg.pages_enabled.?);
        }
        if (msg.default_page != null and msg.default_page.?.len > 0) {
            allocator.free(msg.default_page.?);
        }
    }
};

pub const UserProfileMessage = struct {
    message_index: ?MessageIndex = null,
    /// Used for Morning Report greeting
    friendly_name: ?[:0]u8 = null,
    gender: ?Gender = null,
    age: ?u8 = null,
    height: ?f32 = null,
    weight: ?f32 = null,
    language: ?Language = null,
    elev_setting: ?DisplayMeasure = null,
    weight_setting: ?DisplayMeasure = null,
    resting_heart_rate: ?u8 = null,
    default_max_running_heart_rate: ?u8 = null,
    default_max_biking_heart_rate: ?u8 = null,
    default_max_heart_rate: ?u8 = null,
    hr_setting: ?DisplayHeart = null,
    speed_setting: ?DisplayMeasure = null,
    dist_setting: ?DisplayMeasure = null,
    power_setting: ?DisplayPower = null,
    activity_class: ?ActivityClass = null,
    position_setting: ?DisplayPosition = null,
    temperature_setting: ?DisplayMeasure = null,
    local_id: ?UserLocalId = null,
    global_id: ?[]u8 = null,
    /// Typical wake time
    wake_time: ?LocaltimeIntoDay = null,
    /// Typical bed time
    sleep_time: ?LocaltimeIntoDay = null,
    height_setting: ?DisplayMeasure = null,
    /// User defined running step length set to 0 for auto length
    user_running_step_length: ?f32 = null,
    /// User defined walking step length set to 0 for auto length
    user_walking_step_length: ?f32 = null,
    depth_setting: ?DisplayMeasure = null,
    dive_count: ?u32 = null,

    pub fn fromRawFields(msg: *UserProfileMessage, raw_fields: []const decoder.FieldData, allocator: std.mem.Allocator) !void {
        msg.* = .{};
        for (raw_fields) |rf| {
            switch (rf.id) {
                254 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.message_index = @enumFromInt(rf.raw_value.scalar.uint16);
                },
                0 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .string);
                    msg.*.friendly_name = try allocator.dupeSentinel(u8, rf.raw_value.scalar.string, 0);
                },
                1 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.gender = @enumFromInt(rf.raw_value.scalar.enumeration);
                },
                2 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.age = rf.raw_value.scalar.uint8;
                },
                3 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint8);
                    msg.*.height = (f / 100) - 0;
                },
                4 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint16);
                    msg.*.weight = (f / 10) - 0;
                },
                5 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.language = @enumFromInt(rf.raw_value.scalar.enumeration);
                },
                6 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.elev_setting = @enumFromInt(rf.raw_value.scalar.enumeration);
                },
                7 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.weight_setting = @enumFromInt(rf.raw_value.scalar.enumeration);
                },
                8 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.resting_heart_rate = rf.raw_value.scalar.uint8;
                },
                9 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.default_max_running_heart_rate = rf.raw_value.scalar.uint8;
                },
                10 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.default_max_biking_heart_rate = rf.raw_value.scalar.uint8;
                },
                11 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.default_max_heart_rate = rf.raw_value.scalar.uint8;
                },
                12 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.hr_setting = @enumFromInt(rf.raw_value.scalar.enumeration);
                },
                13 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.speed_setting = @enumFromInt(rf.raw_value.scalar.enumeration);
                },
                14 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.dist_setting = @enumFromInt(rf.raw_value.scalar.enumeration);
                },
                16 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.power_setting = @enumFromInt(rf.raw_value.scalar.enumeration);
                },
                17 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.activity_class = @enumFromInt(rf.raw_value.scalar.enumeration);
                },
                18 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.position_setting = @enumFromInt(rf.raw_value.scalar.enumeration);
                },
                21 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.temperature_setting = @enumFromInt(rf.raw_value.scalar.enumeration);
                },
                22 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.local_id = @enumFromInt(rf.raw_value.scalar.uint16);
                },
                23 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .byte);
                    msg.*.global_id = try allocator.alloc(u8, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        msg.*.global_id[i] = raw_value.byte;
                    }
                },
                28 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.wake_time = @enumFromInt(rf.raw_value.scalar.uint32);
                },
                29 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.sleep_time = @enumFromInt(rf.raw_value.scalar.uint32);
                },
                30 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.height_setting = @enumFromInt(rf.raw_value.scalar.enumeration);
                },
                31 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint16);
                    msg.*.user_running_step_length = (f / 1000) - 0;
                },
                32 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint16);
                    msg.*.user_walking_step_length = (f / 1000) - 0;
                },
                47 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.depth_setting = @enumFromInt(rf.raw_value.scalar.enumeration);
                },
                49 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.dive_count = rf.raw_value.scalar.uint32;
                },
                else => {},
            }
        }
    }

    pub fn deinit(msg: UserProfileMessage, allocator: std.mem.Allocator) void {
        if (msg.friendly_name != null and msg.friendly_name.?.len > 0) {
            allocator.free(msg.friendly_name.?);
        }
        if (msg.global_id != null and msg.global_id.?.len > 0) {
            allocator.free(msg.global_id.?);
        }
    }
};

pub const HrmProfileMessage = struct {
    message_index: ?MessageIndex = null,
    enabled: ?bool = null,
    hrm_ant_id: ?u16 = null,
    log_hrv: ?bool = null,
    hrm_ant_id_trans_type: ?u8 = null,

    pub fn fromRawFields(msg: *HrmProfileMessage, raw_fields: []const decoder.FieldData) !void {
        msg.* = .{};
        for (raw_fields) |rf| {
            switch (rf.id) {
                254 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.message_index = @enumFromInt(rf.raw_value.scalar.uint16);
                },
                1 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16z);
                    msg.*.hrm_ant_id = rf.raw_value.scalar.uint16z;
                },
                3 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8z);
                    msg.*.hrm_ant_id_trans_type = rf.raw_value.scalar.uint8z;
                },
                else => {},
            }
        }
    }
};

pub const SdmProfileMessage = struct {
    message_index: ?MessageIndex = null,
    enabled: ?bool = null,
    sdm_ant_id: ?u16 = null,
    sdm_cal_factor: ?f32 = null,
    odometer: ?f32 = null,
    /// Use footpod for speed source instead of GPS
    speed_source: ?bool = null,
    sdm_ant_id_trans_type: ?u8 = null,
    /// Rollover counter that can be used to extend the odometer
    odometer_rollover: ?u8 = null,

    pub fn fromRawFields(msg: *SdmProfileMessage, raw_fields: []const decoder.FieldData) !void {
        msg.* = .{};
        for (raw_fields) |rf| {
            switch (rf.id) {
                254 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.message_index = @enumFromInt(rf.raw_value.scalar.uint16);
                },
                1 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16z);
                    msg.*.sdm_ant_id = rf.raw_value.scalar.uint16z;
                },
                2 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint16);
                    msg.*.sdm_cal_factor = (f / 10) - 0;
                },
                3 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint32);
                    msg.*.odometer = (f / 100) - 0;
                },
                5 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8z);
                    msg.*.sdm_ant_id_trans_type = rf.raw_value.scalar.uint8z;
                },
                7 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.odometer_rollover = rf.raw_value.scalar.uint8;
                },
                else => {},
            }
        }
    }
};

pub const BikeProfileMessage = struct {
    message_index: ?MessageIndex = null,
    name: ?[:0]u8 = null,
    sport: ?Sport = null,
    sub_sport: ?SubSport = null,
    odometer: ?f32 = null,
    bike_spd_ant_id: ?u16 = null,
    bike_cad_ant_id: ?u16 = null,
    bike_spdcad_ant_id: ?u16 = null,
    bike_power_ant_id: ?u16 = null,
    custom_wheelsize: ?f32 = null,
    auto_wheelsize: ?f32 = null,
    bike_weight: ?f32 = null,
    power_cal_factor: ?f32 = null,
    auto_wheel_cal: ?bool = null,
    auto_power_zero: ?bool = null,
    id: ?u8 = null,
    spd_enabled: ?bool = null,
    cad_enabled: ?bool = null,
    spdcad_enabled: ?bool = null,
    power_enabled: ?bool = null,
    crank_length: ?f32 = null,
    enabled: ?bool = null,
    bike_spd_ant_id_trans_type: ?u8 = null,
    bike_cad_ant_id_trans_type: ?u8 = null,
    bike_spdcad_ant_id_trans_type: ?u8 = null,
    bike_power_ant_id_trans_type: ?u8 = null,
    /// Rollover counter that can be used to extend the odometer
    odometer_rollover: ?u8 = null,
    /// Number of front gears
    front_gear_num: ?u8 = null,
    /// Number of teeth on each gear 0 is innermost
    front_gear: ?[]u8 = null,
    /// Number of rear gears
    rear_gear_num: ?u8 = null,
    /// Number of teeth on each gear 0 is innermost
    rear_gear: ?[]u8 = null,
    shimano_di2_enabled: ?bool = null,

    pub fn fromRawFields(msg: *BikeProfileMessage, raw_fields: []const decoder.FieldData, allocator: std.mem.Allocator) !void {
        msg.* = .{};
        for (raw_fields) |rf| {
            switch (rf.id) {
                254 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.message_index = @enumFromInt(rf.raw_value.scalar.uint16);
                },
                0 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .string);
                    msg.*.name = try allocator.dupeSentinel(u8, rf.raw_value.scalar.string, 0);
                },
                1 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.sport = @enumFromInt(rf.raw_value.scalar.enumeration);
                },
                2 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.sub_sport = @enumFromInt(rf.raw_value.scalar.enumeration);
                },
                3 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint32);
                    msg.*.odometer = (f / 100) - 0;
                },
                4 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16z);
                    msg.*.bike_spd_ant_id = rf.raw_value.scalar.uint16z;
                },
                5 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16z);
                    msg.*.bike_cad_ant_id = rf.raw_value.scalar.uint16z;
                },
                6 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16z);
                    msg.*.bike_spdcad_ant_id = rf.raw_value.scalar.uint16z;
                },
                7 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16z);
                    msg.*.bike_power_ant_id = rf.raw_value.scalar.uint16z;
                },
                8 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint16);
                    msg.*.custom_wheelsize = (f / 1000) - 0;
                },
                9 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint16);
                    msg.*.auto_wheelsize = (f / 1000) - 0;
                },
                10 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint16);
                    msg.*.bike_weight = (f / 10) - 0;
                },
                11 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint16);
                    msg.*.power_cal_factor = (f / 10) - 0;
                },
                14 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.id = rf.raw_value.scalar.uint8;
                },
                19 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint8);
                    msg.*.crank_length = (f / 2) - -110;
                },
                21 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8z);
                    msg.*.bike_spd_ant_id_trans_type = rf.raw_value.scalar.uint8z;
                },
                22 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8z);
                    msg.*.bike_cad_ant_id_trans_type = rf.raw_value.scalar.uint8z;
                },
                23 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8z);
                    msg.*.bike_spdcad_ant_id_trans_type = rf.raw_value.scalar.uint8z;
                },
                24 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8z);
                    msg.*.bike_power_ant_id_trans_type = rf.raw_value.scalar.uint8z;
                },
                37 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.odometer_rollover = rf.raw_value.scalar.uint8;
                },
                38 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8z);
                    msg.*.front_gear_num = rf.raw_value.scalar.uint8z;
                },
                39 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8z);
                    msg.*.front_gear = try allocator.alloc(u8, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        msg.*.front_gear[i] = raw_value.uint8z;
                    }
                },
                40 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8z);
                    msg.*.rear_gear_num = rf.raw_value.scalar.uint8z;
                },
                41 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8z);
                    msg.*.rear_gear = try allocator.alloc(u8, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        msg.*.rear_gear[i] = raw_value.uint8z;
                    }
                },
                else => {},
            }
        }
    }

    pub fn deinit(msg: BikeProfileMessage, allocator: std.mem.Allocator) void {
        if (msg.name != null and msg.name.?.len > 0) {
            allocator.free(msg.name.?);
        }
        if (msg.front_gear != null and msg.front_gear.?.len > 0) {
            allocator.free(msg.front_gear.?);
        }
        if (msg.rear_gear != null and msg.rear_gear.?.len > 0) {
            allocator.free(msg.rear_gear.?);
        }
    }
};

pub const ConnectivityMessage = struct {
    /// Use Bluetooth for connectivity features
    bluetooth_enabled: ?bool = null,
    /// Use Bluetooth Low Energy for connectivity features
    bluetooth_le_enabled: ?bool = null,
    /// Use ANT for connectivity features
    ant_enabled: ?bool = null,
    name: ?[:0]u8 = null,
    live_tracking_enabled: ?bool = null,
    weather_conditions_enabled: ?bool = null,
    weather_alerts_enabled: ?bool = null,
    auto_activity_upload_enabled: ?bool = null,
    course_download_enabled: ?bool = null,
    workout_download_enabled: ?bool = null,
    gps_ephemeris_download_enabled: ?bool = null,
    incident_detection_enabled: ?bool = null,
    grouptrack_enabled: ?bool = null,

    pub fn fromRawFields(msg: *ConnectivityMessage, raw_fields: []const decoder.FieldData, allocator: std.mem.Allocator) !void {
        msg.* = .{};
        for (raw_fields) |rf| {
            switch (rf.id) {
                3 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .string);
                    msg.*.name = try allocator.dupeSentinel(u8, rf.raw_value.scalar.string, 0);
                },
                else => {},
            }
        }
    }

    pub fn deinit(msg: ConnectivityMessage, allocator: std.mem.Allocator) void {
        if (msg.name != null and msg.name.?.len > 0) {
            allocator.free(msg.name.?);
        }
    }
};

pub const WatchfaceSettingsMessage = struct {
    message_index: ?MessageIndex = null,
    mode: ?WatchfaceMode = null,

    pub fn fromRawFields(msg: *WatchfaceSettingsMessage, raw_fields: []const decoder.FieldData) !void {
        msg.* = .{};
        for (raw_fields) |rf| {
            switch (rf.id) {
                254 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.message_index = @enumFromInt(rf.raw_value.scalar.uint16);
                },
                0 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.mode = @enumFromInt(rf.raw_value.scalar.enumeration);
                },
                else => {},
            }
        }
    }
};

pub const OhrSettingsMessage = struct {
    timestamp: ?u32 = null,
    enabled: ?Switch = null,

    pub fn fromRawFields(msg: *OhrSettingsMessage, raw_fields: []const decoder.FieldData) !void {
        msg.* = .{};
        for (raw_fields) |rf| {
            switch (rf.id) {
                253 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.timestamp = rf.raw_value.scalar.uint32;
                },
                0 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.enabled = @enumFromInt(rf.raw_value.scalar.enumeration);
                },
                else => {},
            }
        }
    }
};

pub const TimeInZoneMessage = struct {
    timestamp: ?u32 = null,
    reference_mesg: ?MesgNum = null,
    reference_index: ?MessageIndex = null,
    time_in_hr_zone: ?[]f32 = null,
    time_in_speed_zone: ?[]f32 = null,
    time_in_cadence_zone: ?[]f32 = null,
    time_in_power_zone: ?[]f32 = null,
    hr_zone_high_boundary: ?[]u8 = null,
    speed_zone_high_boundary: ?[]f32 = null,
    cadence_zone_high_bondary: ?[]u8 = null,
    power_zone_high_boundary: ?[]u16 = null,
    hr_calc_type: ?HrZoneCalc = null,
    max_heart_rate: ?u8 = null,
    resting_heart_rate: ?u8 = null,
    threshold_heart_rate: ?u8 = null,
    pwr_calc_type: ?PwrZoneCalc = null,
    functional_threshold_power: ?u16 = null,

    pub fn fromRawFields(msg: *TimeInZoneMessage, raw_fields: []const decoder.FieldData, allocator: std.mem.Allocator) !void {
        msg.* = .{};
        for (raw_fields) |rf| {
            switch (rf.id) {
                253 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.timestamp = rf.raw_value.scalar.uint32;
                },
                0 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.reference_mesg = @enumFromInt(rf.raw_value.scalar.uint16);
                },
                1 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.reference_index = @enumFromInt(rf.raw_value.scalar.uint16);
                },
                2 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.time_in_hr_zone = try allocator.alloc(f32, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        const f: f32 = @floatFromInt(raw_value.uint32);
                        msg.*.time_in_hr_zone.?[i] = (f / 1000) - 0;
                    }
                },
                3 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.time_in_speed_zone = try allocator.alloc(f32, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        const f: f32 = @floatFromInt(raw_value.uint32);
                        msg.*.time_in_speed_zone.?[i] = (f / 1000) - 0;
                    }
                },
                4 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.time_in_cadence_zone = try allocator.alloc(f32, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        const f: f32 = @floatFromInt(raw_value.uint32);
                        msg.*.time_in_cadence_zone.?[i] = (f / 1000) - 0;
                    }
                },
                5 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.time_in_power_zone = try allocator.alloc(f32, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        const f: f32 = @floatFromInt(raw_value.uint32);
                        msg.*.time_in_power_zone.?[i] = (f / 1000) - 0;
                    }
                },
                6 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.hr_zone_high_boundary = try allocator.alloc(u8, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        msg.*.hr_zone_high_boundary[i] = raw_value.uint8;
                    }
                },
                7 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.speed_zone_high_boundary = try allocator.alloc(f32, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        const f: f32 = @floatFromInt(raw_value.uint16);
                        msg.*.speed_zone_high_boundary.?[i] = (f / 1000) - 0;
                    }
                },
                8 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.cadence_zone_high_bondary = try allocator.alloc(u8, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        msg.*.cadence_zone_high_bondary[i] = raw_value.uint8;
                    }
                },
                9 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.power_zone_high_boundary = try allocator.alloc(u16, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        msg.*.power_zone_high_boundary[i] = raw_value.uint16;
                    }
                },
                10 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.hr_calc_type = @enumFromInt(rf.raw_value.scalar.enumeration);
                },
                11 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.max_heart_rate = rf.raw_value.scalar.uint8;
                },
                12 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.resting_heart_rate = rf.raw_value.scalar.uint8;
                },
                13 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.threshold_heart_rate = rf.raw_value.scalar.uint8;
                },
                14 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.pwr_calc_type = @enumFromInt(rf.raw_value.scalar.enumeration);
                },
                15 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.functional_threshold_power = rf.raw_value.scalar.uint16;
                },
                else => {},
            }
        }
    }

    pub fn deinit(msg: TimeInZoneMessage, allocator: std.mem.Allocator) void {
        if (msg.time_in_hr_zone != null and msg.time_in_hr_zone.?.len > 0) {
            allocator.free(msg.time_in_hr_zone.?);
        }
        if (msg.time_in_speed_zone != null and msg.time_in_speed_zone.?.len > 0) {
            allocator.free(msg.time_in_speed_zone.?);
        }
        if (msg.time_in_cadence_zone != null and msg.time_in_cadence_zone.?.len > 0) {
            allocator.free(msg.time_in_cadence_zone.?);
        }
        if (msg.time_in_power_zone != null and msg.time_in_power_zone.?.len > 0) {
            allocator.free(msg.time_in_power_zone.?);
        }
        if (msg.hr_zone_high_boundary != null and msg.hr_zone_high_boundary.?.len > 0) {
            allocator.free(msg.hr_zone_high_boundary.?);
        }
        if (msg.speed_zone_high_boundary != null and msg.speed_zone_high_boundary.?.len > 0) {
            allocator.free(msg.speed_zone_high_boundary.?);
        }
        if (msg.cadence_zone_high_bondary != null and msg.cadence_zone_high_bondary.?.len > 0) {
            allocator.free(msg.cadence_zone_high_bondary.?);
        }
        if (msg.power_zone_high_boundary != null and msg.power_zone_high_boundary.?.len > 0) {
            allocator.free(msg.power_zone_high_boundary.?);
        }
    }
};

pub const ZonesTargetMessage = struct {
    max_heart_rate: ?u8 = null,
    threshold_heart_rate: ?u8 = null,
    functional_threshold_power: ?u16 = null,
    hr_calc_type: ?HrZoneCalc = null,
    pwr_calc_type: ?PwrZoneCalc = null,

    pub fn fromRawFields(msg: *ZonesTargetMessage, raw_fields: []const decoder.FieldData) !void {
        msg.* = .{};
        for (raw_fields) |rf| {
            switch (rf.id) {
                1 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.max_heart_rate = rf.raw_value.scalar.uint8;
                },
                2 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.threshold_heart_rate = rf.raw_value.scalar.uint8;
                },
                3 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.functional_threshold_power = rf.raw_value.scalar.uint16;
                },
                5 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.hr_calc_type = @enumFromInt(rf.raw_value.scalar.enumeration);
                },
                7 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.pwr_calc_type = @enumFromInt(rf.raw_value.scalar.enumeration);
                },
                else => {},
            }
        }
    }
};

pub const SportMessage = struct {
    sport: ?Sport = null,
    sub_sport: ?SubSport = null,
    name: ?[:0]u8 = null,

    pub fn fromRawFields(msg: *SportMessage, raw_fields: []const decoder.FieldData, allocator: std.mem.Allocator) !void {
        msg.* = .{};
        for (raw_fields) |rf| {
            switch (rf.id) {
                0 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.sport = @enumFromInt(rf.raw_value.scalar.enumeration);
                },
                1 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.sub_sport = @enumFromInt(rf.raw_value.scalar.enumeration);
                },
                3 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .string);
                    msg.*.name = try allocator.dupeSentinel(u8, rf.raw_value.scalar.string, 0);
                },
                else => {},
            }
        }
    }

    pub fn deinit(msg: SportMessage, allocator: std.mem.Allocator) void {
        if (msg.name != null and msg.name.?.len > 0) {
            allocator.free(msg.name.?);
        }
    }
};

pub const HrZoneMessage = struct {
    message_index: ?MessageIndex = null,
    high_bpm: ?u8 = null,
    name: ?[:0]u8 = null,

    pub fn fromRawFields(msg: *HrZoneMessage, raw_fields: []const decoder.FieldData, allocator: std.mem.Allocator) !void {
        msg.* = .{};
        for (raw_fields) |rf| {
            switch (rf.id) {
                254 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.message_index = @enumFromInt(rf.raw_value.scalar.uint16);
                },
                1 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.high_bpm = rf.raw_value.scalar.uint8;
                },
                2 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .string);
                    msg.*.name = try allocator.dupeSentinel(u8, rf.raw_value.scalar.string, 0);
                },
                else => {},
            }
        }
    }

    pub fn deinit(msg: HrZoneMessage, allocator: std.mem.Allocator) void {
        if (msg.name != null and msg.name.?.len > 0) {
            allocator.free(msg.name.?);
        }
    }
};

pub const SpeedZoneMessage = struct {
    message_index: ?MessageIndex = null,
    high_value: ?f32 = null,
    name: ?[:0]u8 = null,

    pub fn fromRawFields(msg: *SpeedZoneMessage, raw_fields: []const decoder.FieldData, allocator: std.mem.Allocator) !void {
        msg.* = .{};
        for (raw_fields) |rf| {
            switch (rf.id) {
                254 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.message_index = @enumFromInt(rf.raw_value.scalar.uint16);
                },
                0 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint16);
                    msg.*.high_value = (f / 1000) - 0;
                },
                1 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .string);
                    msg.*.name = try allocator.dupeSentinel(u8, rf.raw_value.scalar.string, 0);
                },
                else => {},
            }
        }
    }

    pub fn deinit(msg: SpeedZoneMessage, allocator: std.mem.Allocator) void {
        if (msg.name != null and msg.name.?.len > 0) {
            allocator.free(msg.name.?);
        }
    }
};

pub const CadenceZoneMessage = struct {
    message_index: ?MessageIndex = null,
    high_value: ?u8 = null,
    name: ?[:0]u8 = null,

    pub fn fromRawFields(msg: *CadenceZoneMessage, raw_fields: []const decoder.FieldData, allocator: std.mem.Allocator) !void {
        msg.* = .{};
        for (raw_fields) |rf| {
            switch (rf.id) {
                254 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.message_index = @enumFromInt(rf.raw_value.scalar.uint16);
                },
                0 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.high_value = rf.raw_value.scalar.uint8;
                },
                1 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .string);
                    msg.*.name = try allocator.dupeSentinel(u8, rf.raw_value.scalar.string, 0);
                },
                else => {},
            }
        }
    }

    pub fn deinit(msg: CadenceZoneMessage, allocator: std.mem.Allocator) void {
        if (msg.name != null and msg.name.?.len > 0) {
            allocator.free(msg.name.?);
        }
    }
};

pub const PowerZoneMessage = struct {
    message_index: ?MessageIndex = null,
    high_value: ?u16 = null,
    name: ?[:0]u8 = null,

    pub fn fromRawFields(msg: *PowerZoneMessage, raw_fields: []const decoder.FieldData, allocator: std.mem.Allocator) !void {
        msg.* = .{};
        for (raw_fields) |rf| {
            switch (rf.id) {
                254 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.message_index = @enumFromInt(rf.raw_value.scalar.uint16);
                },
                1 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.high_value = rf.raw_value.scalar.uint16;
                },
                2 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .string);
                    msg.*.name = try allocator.dupeSentinel(u8, rf.raw_value.scalar.string, 0);
                },
                else => {},
            }
        }
    }

    pub fn deinit(msg: PowerZoneMessage, allocator: std.mem.Allocator) void {
        if (msg.name != null and msg.name.?.len > 0) {
            allocator.free(msg.name.?);
        }
    }
};

pub const MetZoneMessage = struct {
    message_index: ?MessageIndex = null,
    high_bpm: ?u8 = null,
    calories: ?f32 = null,
    fat_calories: ?f32 = null,

    pub fn fromRawFields(msg: *MetZoneMessage, raw_fields: []const decoder.FieldData) !void {
        msg.* = .{};
        for (raw_fields) |rf| {
            switch (rf.id) {
                254 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.message_index = @enumFromInt(rf.raw_value.scalar.uint16);
                },
                1 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.high_bpm = rf.raw_value.scalar.uint8;
                },
                2 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint16);
                    msg.*.calories = (f / 10) - 0;
                },
                3 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint8);
                    msg.*.fat_calories = (f / 10) - 0;
                },
                else => {},
            }
        }
    }
};

pub const TrainingSettingsMessage = struct {
    target_distance: ?f32 = null,
    target_speed: ?f32 = null,
    target_time: ?u32 = null,
    /// A more precise target speed field
    precise_target_speed: ?f32 = null,

    pub fn fromRawFields(msg: *TrainingSettingsMessage, raw_fields: []const decoder.FieldData) !void {
        msg.* = .{};
        for (raw_fields) |rf| {
            switch (rf.id) {
                31 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint32);
                    msg.*.target_distance = (f / 100) - 0;
                },
                32 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint16);
                    msg.*.target_speed = (f / 1000) - 0;
                },
                33 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.target_time = rf.raw_value.scalar.uint32;
                },
                153 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint32);
                    msg.*.precise_target_speed = (f / 1000000) - 0;
                },
                else => {},
            }
        }
    }
};

pub const DiveSettingsMessage = struct {
    timestamp: ?u32 = null,
    message_index: ?MessageIndex = null,
    name: ?[:0]u8 = null,
    model: ?TissueModelType = null,
    gf_low: ?u8 = null,
    gf_high: ?u8 = null,
    water_type: ?WaterType = null,
    /// Fresh water is usually 1000; salt water is usually 1025
    water_density: ?f32 = null,
    /// Typically 1.40
    po2_warn: ?f32 = null,
    /// Typically 1.60
    po2_critical: ?f32 = null,
    po2_deco: ?f32 = null,
    safety_stop_enabled: ?bool = null,
    bottom_depth: ?f32 = null,
    bottom_time: ?u32 = null,
    apnea_countdown_enabled: ?bool = null,
    apnea_countdown_time: ?u32 = null,
    backlight_mode: ?DiveBacklightMode = null,
    backlight_brightness: ?u8 = null,
    backlight_timeout: ?BacklightTimeout = null,
    /// Time between surfacing and ending the activity
    repeat_dive_interval: ?f32 = null,
    /// Time at safety stop (if enabled)
    safety_stop_time: ?f32 = null,
    heart_rate_source_type: ?SourceType = null,
    /// Index of travel dive_gas message
    travel_gas: ?MessageIndex = null,
    /// If low PO2 should be switched to automatically
    ccr_low_setpoint_switch_mode: ?CcrSetpointSwitchMode = null,
    /// Target PO2 when using low setpoint
    ccr_low_setpoint: ?f32 = null,
    /// Depth to switch to low setpoint in automatic mode
    ccr_low_setpoint_depth: ?f32 = null,
    /// If high PO2 should be switched to automatically
    ccr_high_setpoint_switch_mode: ?CcrSetpointSwitchMode = null,
    /// Target PO2 when using high setpoint
    ccr_high_setpoint: ?f32 = null,
    /// Depth to switch to high setpoint in automatic mode
    ccr_high_setpoint_depth: ?f32 = null,
    /// Type of gas consumption rate to display. Some values are only valid if tank volume is known.
    gas_consumption_display: ?GasConsumptionRateType = null,
    /// Indicates whether the up key is enabled during dives
    up_key_enabled: ?bool = null,
    /// Sounds and vibration enabled or disabled in-dive
    dive_sounds: ?Tone = null,
    /// Usually 1.0/1.5/2.0 representing 3/4.5/6m or 10/15/20ft
    last_stop_multiple: ?f32 = null,
    /// Indicates which guidelines to use for no-fly surface interval.
    no_fly_time_mode: ?NoFlyTimeMode = null,

    pub fn fromRawFields(msg: *DiveSettingsMessage, raw_fields: []const decoder.FieldData, allocator: std.mem.Allocator) !void {
        msg.* = .{};
        for (raw_fields) |rf| {
            switch (rf.id) {
                253 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.timestamp = rf.raw_value.scalar.uint32;
                },
                254 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.message_index = @enumFromInt(rf.raw_value.scalar.uint16);
                },
                0 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .string);
                    msg.*.name = try allocator.dupeSentinel(u8, rf.raw_value.scalar.string, 0);
                },
                1 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.model = @enumFromInt(rf.raw_value.scalar.enumeration);
                },
                2 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.gf_low = rf.raw_value.scalar.uint8;
                },
                3 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.gf_high = rf.raw_value.scalar.uint8;
                },
                4 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.water_type = @enumFromInt(rf.raw_value.scalar.enumeration);
                },
                5 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .float32);
                    msg.*.water_density = rf.raw_value.scalar.float32;
                },
                6 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint8);
                    msg.*.po2_warn = (f / 100) - 0;
                },
                7 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint8);
                    msg.*.po2_critical = (f / 100) - 0;
                },
                8 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint8);
                    msg.*.po2_deco = (f / 100) - 0;
                },
                10 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .float32);
                    msg.*.bottom_depth = rf.raw_value.scalar.float32;
                },
                11 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.bottom_time = rf.raw_value.scalar.uint32;
                },
                13 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.apnea_countdown_time = rf.raw_value.scalar.uint32;
                },
                14 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.backlight_mode = @enumFromInt(rf.raw_value.scalar.enumeration);
                },
                15 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.backlight_brightness = rf.raw_value.scalar.uint8;
                },
                16 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.backlight_timeout = @enumFromInt(rf.raw_value.scalar.uint8);
                },
                17 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint16);
                    msg.*.repeat_dive_interval = (f / 1) - 0;
                },
                18 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint16);
                    msg.*.safety_stop_time = (f / 1) - 0;
                },
                19 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.heart_rate_source_type = @enumFromInt(rf.raw_value.scalar.enumeration);
                },
                21 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.travel_gas = @enumFromInt(rf.raw_value.scalar.uint16);
                },
                22 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.ccr_low_setpoint_switch_mode = @enumFromInt(rf.raw_value.scalar.enumeration);
                },
                23 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint8);
                    msg.*.ccr_low_setpoint = (f / 100) - 0;
                },
                24 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint32);
                    msg.*.ccr_low_setpoint_depth = (f / 1000) - 0;
                },
                25 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.ccr_high_setpoint_switch_mode = @enumFromInt(rf.raw_value.scalar.enumeration);
                },
                26 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint8);
                    msg.*.ccr_high_setpoint = (f / 100) - 0;
                },
                27 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint32);
                    msg.*.ccr_high_setpoint_depth = (f / 1000) - 0;
                },
                29 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.gas_consumption_display = @enumFromInt(rf.raw_value.scalar.enumeration);
                },
                35 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.dive_sounds = @enumFromInt(rf.raw_value.scalar.enumeration);
                },
                36 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint8);
                    msg.*.last_stop_multiple = (f / 10) - 0;
                },
                37 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.no_fly_time_mode = @enumFromInt(rf.raw_value.scalar.enumeration);
                },
                else => {},
            }
        }
    }

    pub fn deinit(msg: DiveSettingsMessage, allocator: std.mem.Allocator) void {
        if (msg.name != null and msg.name.?.len > 0) {
            allocator.free(msg.name.?);
        }
    }
};

pub const DiveAlarmMessage = struct {
    /// Index of the alarm
    message_index: ?MessageIndex = null,
    /// Depth setting (m) for depth type alarms
    depth: ?f32 = null,
    /// Time setting (s) for time type alarms
    time: ?f32 = null,
    /// Enablement flag
    enabled: ?bool = null,
    /// Alarm type setting
    alarm_type: ?DiveAlarmType = null,
    /// Tone and Vibe setting for the alarm
    sound: ?Tone = null,
    /// Dive types the alarm will trigger on
    dive_types: ?[]SubSport = null,
    /// Alarm ID
    id: ?u32 = null,
    /// Show a visible pop-up for this alarm
    popup_enabled: ?bool = null,
    /// Trigger the alarm on descent
    trigger_on_descent: ?bool = null,
    /// Trigger the alarm on ascent
    trigger_on_ascent: ?bool = null,
    /// Repeat alarm each time threshold is crossed?
    repeating: ?bool = null,
    /// Ascent/descent rate (mps) setting for speed type alarms
    speed: ?f32 = null,

    pub fn fromRawFields(msg: *DiveAlarmMessage, raw_fields: []const decoder.FieldData, allocator: std.mem.Allocator) !void {
        msg.* = .{};
        for (raw_fields) |rf| {
            switch (rf.id) {
                254 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.message_index = @enumFromInt(rf.raw_value.scalar.uint16);
                },
                0 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint32);
                    msg.*.depth = (f / 1000) - 0;
                },
                1 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .sint32);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.sint32);
                    msg.*.time = (f / 1) - 0;
                },
                3 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.alarm_type = @enumFromInt(rf.raw_value.scalar.enumeration);
                },
                4 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.sound = @enumFromInt(rf.raw_value.scalar.enumeration);
                },
                5 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.dive_types = try allocator.alloc(SubSport, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        msg.*.dive_types[i] = raw_value.enumeration;
                    }
                },
                6 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.id = rf.raw_value.scalar.uint32;
                },
                11 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .sint32);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.sint32);
                    msg.*.speed = (f / 1000) - 0;
                },
                else => {},
            }
        }
    }

    pub fn deinit(msg: DiveAlarmMessage, allocator: std.mem.Allocator) void {
        if (msg.dive_types != null and msg.dive_types.?.len > 0) {
            allocator.free(msg.dive_types.?);
        }
    }
};

pub const DiveApneaAlarmMessage = struct {
    /// Index of the alarm
    message_index: ?MessageIndex = null,
    /// Depth setting (m) for depth type alarms
    depth: ?f32 = null,
    /// Time setting (s) for time type alarms
    time: ?f32 = null,
    /// Enablement flag
    enabled: ?bool = null,
    /// Alarm type setting
    alarm_type: ?DiveAlarmType = null,
    /// Tone and Vibe setting for the alarm.
    sound: ?Tone = null,
    /// Dive types the alarm will trigger on
    dive_types: ?[]SubSport = null,
    /// Alarm ID
    id: ?u32 = null,
    /// Show a visible pop-up for this alarm
    popup_enabled: ?bool = null,
    /// Trigger the alarm on descent
    trigger_on_descent: ?bool = null,
    /// Trigger the alarm on ascent
    trigger_on_ascent: ?bool = null,
    /// Repeat alarm each time threshold is crossed?
    repeating: ?bool = null,
    /// Ascent/descent rate (mps) setting for speed type alarms
    speed: ?f32 = null,

    pub fn fromRawFields(msg: *DiveApneaAlarmMessage, raw_fields: []const decoder.FieldData, allocator: std.mem.Allocator) !void {
        msg.* = .{};
        for (raw_fields) |rf| {
            switch (rf.id) {
                254 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.message_index = @enumFromInt(rf.raw_value.scalar.uint16);
                },
                0 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint32);
                    msg.*.depth = (f / 1000) - 0;
                },
                1 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .sint32);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.sint32);
                    msg.*.time = (f / 1) - 0;
                },
                3 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.alarm_type = @enumFromInt(rf.raw_value.scalar.enumeration);
                },
                4 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.sound = @enumFromInt(rf.raw_value.scalar.enumeration);
                },
                5 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.dive_types = try allocator.alloc(SubSport, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        msg.*.dive_types[i] = raw_value.enumeration;
                    }
                },
                6 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.id = rf.raw_value.scalar.uint32;
                },
                11 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .sint32);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.sint32);
                    msg.*.speed = (f / 1000) - 0;
                },
                else => {},
            }
        }
    }

    pub fn deinit(msg: DiveApneaAlarmMessage, allocator: std.mem.Allocator) void {
        if (msg.dive_types != null and msg.dive_types.?.len > 0) {
            allocator.free(msg.dive_types.?);
        }
    }
};

pub const DiveGasMessage = struct {
    message_index: ?MessageIndex = null,
    helium_content: ?u8 = null,
    oxygen_content: ?u8 = null,
    status: ?DiveGasStatus = null,
    mode: ?DiveGasMode = null,

    pub fn fromRawFields(msg: *DiveGasMessage, raw_fields: []const decoder.FieldData) !void {
        msg.* = .{};
        for (raw_fields) |rf| {
            switch (rf.id) {
                254 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.message_index = @enumFromInt(rf.raw_value.scalar.uint16);
                },
                0 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.helium_content = rf.raw_value.scalar.uint8;
                },
                1 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.oxygen_content = rf.raw_value.scalar.uint8;
                },
                2 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.status = @enumFromInt(rf.raw_value.scalar.enumeration);
                },
                3 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.mode = @enumFromInt(rf.raw_value.scalar.enumeration);
                },
                else => {},
            }
        }
    }
};

pub const GoalMessage = struct {
    message_index: ?MessageIndex = null,
    sport: ?Sport = null,
    sub_sport: ?SubSport = null,
    start_date: ?u32 = null,
    end_date: ?u32 = null,
    type: ?Goal = null,
    value: ?u32 = null,
    repeat: ?bool = null,
    target_value: ?u32 = null,
    recurrence: ?GoalRecurrence = null,
    recurrence_value: ?u16 = null,
    enabled: ?bool = null,
    source: ?GoalSource = null,

    pub fn fromRawFields(msg: *GoalMessage, raw_fields: []const decoder.FieldData) !void {
        msg.* = .{};
        for (raw_fields) |rf| {
            switch (rf.id) {
                254 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.message_index = @enumFromInt(rf.raw_value.scalar.uint16);
                },
                0 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.sport = @enumFromInt(rf.raw_value.scalar.enumeration);
                },
                1 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.sub_sport = @enumFromInt(rf.raw_value.scalar.enumeration);
                },
                2 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.start_date = rf.raw_value.scalar.uint32;
                },
                3 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.end_date = rf.raw_value.scalar.uint32;
                },
                4 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.type = @enumFromInt(rf.raw_value.scalar.enumeration);
                },
                5 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.value = rf.raw_value.scalar.uint32;
                },
                7 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.target_value = rf.raw_value.scalar.uint32;
                },
                8 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.recurrence = @enumFromInt(rf.raw_value.scalar.enumeration);
                },
                9 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.recurrence_value = rf.raw_value.scalar.uint16;
                },
                11 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.source = @enumFromInt(rf.raw_value.scalar.enumeration);
                },
                else => {},
            }
        }
    }
};

pub const ActivityMessage = struct {
    timestamp: ?u32 = null,
    /// Exclude pauses
    total_timer_time: ?f32 = null,
    num_sessions: ?u16 = null,
    type: ?Activity = null,
    event: ?Event = null,
    event_type: ?EventType = null,
    /// timestamp epoch expressed in local time, used to convert activity timestamps to local time
    local_timestamp: ?u32 = null,
    event_group: ?u8 = null,

    pub fn fromRawFields(msg: *ActivityMessage, raw_fields: []const decoder.FieldData) !void {
        msg.* = .{};
        for (raw_fields) |rf| {
            switch (rf.id) {
                253 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.timestamp = rf.raw_value.scalar.uint32;
                },
                0 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint32);
                    msg.*.total_timer_time = (f / 1000) - 0;
                },
                1 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.num_sessions = rf.raw_value.scalar.uint16;
                },
                2 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.type = @enumFromInt(rf.raw_value.scalar.enumeration);
                },
                3 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.event = @enumFromInt(rf.raw_value.scalar.enumeration);
                },
                4 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.event_type = @enumFromInt(rf.raw_value.scalar.enumeration);
                },
                5 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.local_timestamp = rf.raw_value.scalar.uint32;
                },
                6 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.event_group = rf.raw_value.scalar.uint8;
                },
                else => {},
            }
        }
    }
};

pub const SessionMessage = struct {
    /// Selected bit is set for the current session.
    message_index: ?MessageIndex = null,
    timestamp: ?u32 = null,
    /// session
    event: ?Event = null,
    /// stop
    event_type: ?EventType = null,
    start_time: ?u32 = null,
    start_position_lat: ?i32 = null,
    start_position_long: ?i32 = null,
    sport: ?Sport = null,
    sub_sport: ?SubSport = null,
    /// Time (includes pauses)
    total_elapsed_time: ?f32 = null,
    /// Timer Time (excludes pauses)
    total_timer_time: ?f32 = null,
    total_distance: ?f32 = null,
    total_calories: ?u16 = null,
    total_fat_calories: ?u16 = null,
    /// total_distance / total_timer_time
    avg_speed: ?f32 = null,
    max_speed: ?f32 = null,
    /// average heart rate (excludes pause time)
    avg_heart_rate: ?u8 = null,
    max_heart_rate: ?u8 = null,
    /// total_power / total_timer_time if non_zero_avg_power otherwise total_power / total_elapsed_time
    avg_power: ?u16 = null,
    max_power: ?u16 = null,
    total_ascent: ?u16 = null,
    total_descent: ?u16 = null,
    total_training_effect: ?f32 = null,
    first_lap_index: ?u16 = null,
    num_laps: ?u16 = null,
    event_group: ?u8 = null,
    trigger: ?SessionTrigger = null,
    /// North east corner latitude
    nec_lat: ?i32 = null,
    /// North east corner longitude
    nec_long: ?i32 = null,
    /// South west corner latitude
    swc_lat: ?i32 = null,
    /// South west corner longitude
    swc_long: ?i32 = null,
    /// # of lengths of swim pool
    num_lengths: ?u16 = null,
    normalized_power: ?u16 = null,
    training_stress_score: ?f32 = null,
    intensity_factor: ?f32 = null,
    left_right_balance: ?LeftRightBalance100 = null,
    end_position_lat: ?i32 = null,
    end_position_long: ?i32 = null,
    avg_stroke_count: ?f32 = null,
    avg_stroke_distance: ?f32 = null,
    swim_stroke: ?SwimStroke = null,
    pool_length: ?f32 = null,
    threshold_power: ?u16 = null,
    pool_length_unit: ?DisplayMeasure = null,
    /// # of active lengths of swim pool
    num_active_lengths: ?u16 = null,
    total_work: ?u32 = null,
    avg_altitude: ?f32 = null,
    max_altitude: ?f32 = null,
    gps_accuracy: ?u8 = null,
    avg_grade: ?f32 = null,
    avg_pos_grade: ?f32 = null,
    avg_neg_grade: ?f32 = null,
    max_pos_grade: ?f32 = null,
    max_neg_grade: ?f32 = null,
    avg_temperature: ?i8 = null,
    max_temperature: ?i8 = null,
    total_moving_time: ?f32 = null,
    avg_pos_vertical_speed: ?f32 = null,
    avg_neg_vertical_speed: ?f32 = null,
    max_pos_vertical_speed: ?f32 = null,
    max_neg_vertical_speed: ?f32 = null,
    min_heart_rate: ?u8 = null,
    time_in_hr_zone: ?[]f32 = null,
    time_in_speed_zone: ?[]f32 = null,
    time_in_cadence_zone: ?[]f32 = null,
    time_in_power_zone: ?[]f32 = null,
    avg_lap_time: ?f32 = null,
    best_lap_index: ?u16 = null,
    min_altitude: ?f32 = null,
    active_time: ?f32 = null,
    player_score: ?u16 = null,
    opponent_score: ?u16 = null,
    opponent_name: ?[:0]u8 = null,
    /// stroke_type enum used as the index
    stroke_count: ?[]u16 = null,
    /// zone number used as the index
    zone_count: ?[]u16 = null,
    max_ball_speed: ?f32 = null,
    avg_ball_speed: ?f32 = null,
    avg_vertical_oscillation: ?f32 = null,
    avg_stance_time_percent: ?f32 = null,
    avg_stance_time: ?f32 = null,
    /// fractional part of the avg_cadence
    avg_fractional_cadence: ?f32 = null,
    /// fractional part of the max_cadence
    max_fractional_cadence: ?f32 = null,
    /// fractional part of the total_cycles
    total_fractional_cycles: ?f32 = null,
    /// Avg saturated and unsaturated hemoglobin
    avg_total_hemoglobin_conc: ?[]f32 = null,
    /// Min saturated and unsaturated hemoglobin
    min_total_hemoglobin_conc: ?[]f32 = null,
    /// Max saturated and unsaturated hemoglobin
    max_total_hemoglobin_conc: ?[]f32 = null,
    /// Avg percentage of hemoglobin saturated with oxygen
    avg_saturated_hemoglobin_percent: ?[]f32 = null,
    /// Min percentage of hemoglobin saturated with oxygen
    min_saturated_hemoglobin_percent: ?[]f32 = null,
    /// Max percentage of hemoglobin saturated with oxygen
    max_saturated_hemoglobin_percent: ?[]f32 = null,
    avg_left_torque_effectiveness: ?f32 = null,
    avg_right_torque_effectiveness: ?f32 = null,
    avg_left_pedal_smoothness: ?f32 = null,
    avg_right_pedal_smoothness: ?f32 = null,
    avg_combined_pedal_smoothness: ?f32 = null,
    /// Sport name from associated sport mesg
    sport_profile_name: ?[:0]u8 = null,
    sport_index: ?u8 = null,
    /// Total time spend in the standing position
    time_standing: ?f32 = null,
    /// Number of transitions to the standing state
    stand_count: ?u16 = null,
    /// Average platform center offset Left
    avg_left_pco: ?i8 = null,
    /// Average platform center offset Right
    avg_right_pco: ?i8 = null,
    /// Average left power phase angles. Indexes defined by power_phase_type.
    avg_left_power_phase: ?[]f32 = null,
    /// Average left power phase peak angles. Data value indexes defined by power_phase_type.
    avg_left_power_phase_peak: ?[]f32 = null,
    /// Average right power phase angles. Data value indexes defined by power_phase_type.
    avg_right_power_phase: ?[]f32 = null,
    /// Average right power phase peak angles data value indexes defined by power_phase_type.
    avg_right_power_phase_peak: ?[]f32 = null,
    /// Average power by position. Data value indexes defined by rider_position_type.
    avg_power_position: ?[]u16 = null,
    /// Maximum power by position. Data value indexes defined by rider_position_type.
    max_power_position: ?[]u16 = null,
    /// Average cadence by position. Data value indexes defined by rider_position_type.
    avg_cadence_position: ?[]u8 = null,
    /// Maximum cadence by position. Data value indexes defined by rider_position_type.
    max_cadence_position: ?[]u8 = null,
    /// total_distance / total_timer_time
    enhanced_avg_speed: ?f32 = null,
    enhanced_max_speed: ?f32 = null,
    enhanced_avg_altitude: ?f32 = null,
    enhanced_min_altitude: ?f32 = null,
    enhanced_max_altitude: ?f32 = null,
    /// lev average motor power during session
    avg_lev_motor_power: ?u16 = null,
    /// lev maximum motor power during session
    max_lev_motor_power: ?u16 = null,
    /// lev battery consumption during session
    lev_battery_consumption: ?f32 = null,
    avg_vertical_ratio: ?f32 = null,
    avg_stance_time_balance: ?f32 = null,
    avg_step_length: ?f32 = null,
    total_anaerobic_training_effect: ?f32 = null,
    avg_vam: ?f32 = null,
    /// 0 if above water
    avg_depth: ?f32 = null,
    /// 0 if above water
    max_depth: ?f32 = null,
    /// Time since end of last dive
    surface_interval: ?f32 = null,
    start_cns: ?f32 = null,
    end_cns: ?f32 = null,
    start_n2: ?f32 = null,
    end_n2: ?f32 = null,
    avg_respiration_rate: ?u8 = null,
    max_respiration_rate: ?u8 = null,
    min_respiration_rate: ?u8 = null,
    min_temperature: ?i8 = null,
    o2_toxicity: ?u16 = null,
    dive_number: ?u32 = null,
    training_load_peak: ?f32 = null,
    enhanced_avg_respiration_rate: ?f32 = null,
    enhanced_max_respiration_rate: ?f32 = null,
    enhanced_min_respiration_rate: ?f32 = null,
    /// The grit score estimates how challenging a route could be for a cyclist in terms of time spent going over sharp turns or large grade slopes.
    total_grit: ?f32 = null,
    /// The flow score estimates how long distance wise a cyclist deaccelerates over intervals where deacceleration is unnecessary such as smooth turns or small grade angle intervals.
    total_flow: ?f32 = null,
    jump_count: ?u16 = null,
    /// The grit score estimates how challenging a route could be for a cyclist in terms of time spent going over sharp turns or large grade slopes.
    avg_grit: ?f32 = null,
    /// The flow score estimates how long distance wise a cyclist deaccelerates over intervals where deacceleration is unnecessary such as smooth turns or small grade angle intervals.
    avg_flow: ?f32 = null,
    /// A 0-100 scale representing how a user felt while performing a workout. Low values are considered feeling bad, while high values are good.
    workout_feel: ?u8 = null,
    /// Common Borg CR10 / 0-10 RPE scale, multiplied 10x.. Aggregate score for all workouts in a single session.
    workout_rpe: ?u8 = null,
    /// Average SPO2 for the monitoring session
    avg_spo2: ?u8 = null,
    /// Average stress for the monitoring session
    avg_stress: ?u8 = null,
    metabolic_calories: ?u16 = null,
    /// Standard deviation of R-R interval (SDRR) - Heart rate variability measure most useful for wellness users.
    sdrr_hrv: ?u8 = null,
    /// Root mean square successive difference (RMSSD) - Heart rate variability measure most useful for athletes
    rmssd_hrv: ?u8 = null,
    /// fractional part of total_ascent
    total_fractional_ascent: ?f32 = null,
    /// fractional part of total_descent
    total_fractional_descent: ?f32 = null,
    avg_core_temperature: ?f32 = null,
    min_core_temperature: ?f32 = null,
    max_core_temperature: ?f32 = null,

    pub fn fromRawFields(msg: *SessionMessage, raw_fields: []const decoder.FieldData, allocator: std.mem.Allocator) !void {
        msg.* = .{};
        for (raw_fields) |rf| {
            switch (rf.id) {
                254 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.message_index = @enumFromInt(rf.raw_value.scalar.uint16);
                },
                253 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.timestamp = rf.raw_value.scalar.uint32;
                },
                0 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.event = @enumFromInt(rf.raw_value.scalar.enumeration);
                },
                1 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.event_type = @enumFromInt(rf.raw_value.scalar.enumeration);
                },
                2 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.start_time = rf.raw_value.scalar.uint32;
                },
                3 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .sint32);
                    msg.*.start_position_lat = rf.raw_value.scalar.sint32;
                },
                4 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .sint32);
                    msg.*.start_position_long = rf.raw_value.scalar.sint32;
                },
                5 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.sport = @enumFromInt(rf.raw_value.scalar.enumeration);
                },
                6 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.sub_sport = @enumFromInt(rf.raw_value.scalar.enumeration);
                },
                7 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint32);
                    msg.*.total_elapsed_time = (f / 1000) - 0;
                },
                8 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint32);
                    msg.*.total_timer_time = (f / 1000) - 0;
                },
                9 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint32);
                    msg.*.total_distance = (f / 100) - 0;
                },
                11 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.total_calories = rf.raw_value.scalar.uint16;
                },
                13 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.total_fat_calories = rf.raw_value.scalar.uint16;
                },
                14 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint16);
                    msg.*.avg_speed = (f / 1000) - 0;
                },
                15 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint16);
                    msg.*.max_speed = (f / 1000) - 0;
                },
                16 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.avg_heart_rate = rf.raw_value.scalar.uint8;
                },
                17 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.max_heart_rate = rf.raw_value.scalar.uint8;
                },
                20 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.avg_power = rf.raw_value.scalar.uint16;
                },
                21 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.max_power = rf.raw_value.scalar.uint16;
                },
                22 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.total_ascent = rf.raw_value.scalar.uint16;
                },
                23 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.total_descent = rf.raw_value.scalar.uint16;
                },
                24 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint8);
                    msg.*.total_training_effect = (f / 10) - 0;
                },
                25 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.first_lap_index = rf.raw_value.scalar.uint16;
                },
                26 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.num_laps = rf.raw_value.scalar.uint16;
                },
                27 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.event_group = rf.raw_value.scalar.uint8;
                },
                28 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.trigger = @enumFromInt(rf.raw_value.scalar.enumeration);
                },
                29 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .sint32);
                    msg.*.nec_lat = rf.raw_value.scalar.sint32;
                },
                30 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .sint32);
                    msg.*.nec_long = rf.raw_value.scalar.sint32;
                },
                31 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .sint32);
                    msg.*.swc_lat = rf.raw_value.scalar.sint32;
                },
                32 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .sint32);
                    msg.*.swc_long = rf.raw_value.scalar.sint32;
                },
                33 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.num_lengths = rf.raw_value.scalar.uint16;
                },
                34 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.normalized_power = rf.raw_value.scalar.uint16;
                },
                35 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint16);
                    msg.*.training_stress_score = (f / 10) - 0;
                },
                36 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint16);
                    msg.*.intensity_factor = (f / 1000) - 0;
                },
                37 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.left_right_balance = @enumFromInt(rf.raw_value.scalar.uint16);
                },
                38 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .sint32);
                    msg.*.end_position_lat = rf.raw_value.scalar.sint32;
                },
                39 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .sint32);
                    msg.*.end_position_long = rf.raw_value.scalar.sint32;
                },
                41 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint32);
                    msg.*.avg_stroke_count = (f / 10) - 0;
                },
                42 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint16);
                    msg.*.avg_stroke_distance = (f / 100) - 0;
                },
                43 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.swim_stroke = @enumFromInt(rf.raw_value.scalar.enumeration);
                },
                44 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint16);
                    msg.*.pool_length = (f / 100) - 0;
                },
                45 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.threshold_power = rf.raw_value.scalar.uint16;
                },
                46 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.pool_length_unit = @enumFromInt(rf.raw_value.scalar.enumeration);
                },
                47 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.num_active_lengths = rf.raw_value.scalar.uint16;
                },
                48 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.total_work = rf.raw_value.scalar.uint32;
                },
                49 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint16);
                    msg.*.avg_altitude = (f / 5) - 500;
                },
                50 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint16);
                    msg.*.max_altitude = (f / 5) - 500;
                },
                51 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.gps_accuracy = rf.raw_value.scalar.uint8;
                },
                52 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .sint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.sint16);
                    msg.*.avg_grade = (f / 100) - 0;
                },
                53 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .sint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.sint16);
                    msg.*.avg_pos_grade = (f / 100) - 0;
                },
                54 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .sint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.sint16);
                    msg.*.avg_neg_grade = (f / 100) - 0;
                },
                55 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .sint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.sint16);
                    msg.*.max_pos_grade = (f / 100) - 0;
                },
                56 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .sint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.sint16);
                    msg.*.max_neg_grade = (f / 100) - 0;
                },
                57 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .sint8);
                    msg.*.avg_temperature = rf.raw_value.scalar.sint8;
                },
                58 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .sint8);
                    msg.*.max_temperature = rf.raw_value.scalar.sint8;
                },
                59 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint32);
                    msg.*.total_moving_time = (f / 1000) - 0;
                },
                60 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .sint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.sint16);
                    msg.*.avg_pos_vertical_speed = (f / 1000) - 0;
                },
                61 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .sint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.sint16);
                    msg.*.avg_neg_vertical_speed = (f / 1000) - 0;
                },
                62 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .sint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.sint16);
                    msg.*.max_pos_vertical_speed = (f / 1000) - 0;
                },
                63 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .sint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.sint16);
                    msg.*.max_neg_vertical_speed = (f / 1000) - 0;
                },
                64 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.min_heart_rate = rf.raw_value.scalar.uint8;
                },
                65 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.time_in_hr_zone = try allocator.alloc(f32, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        const f: f32 = @floatFromInt(raw_value.uint32);
                        msg.*.time_in_hr_zone.?[i] = (f / 1000) - 0;
                    }
                },
                66 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.time_in_speed_zone = try allocator.alloc(f32, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        const f: f32 = @floatFromInt(raw_value.uint32);
                        msg.*.time_in_speed_zone.?[i] = (f / 1000) - 0;
                    }
                },
                67 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.time_in_cadence_zone = try allocator.alloc(f32, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        const f: f32 = @floatFromInt(raw_value.uint32);
                        msg.*.time_in_cadence_zone.?[i] = (f / 1000) - 0;
                    }
                },
                68 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.time_in_power_zone = try allocator.alloc(f32, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        const f: f32 = @floatFromInt(raw_value.uint32);
                        msg.*.time_in_power_zone.?[i] = (f / 1000) - 0;
                    }
                },
                69 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint32);
                    msg.*.avg_lap_time = (f / 1000) - 0;
                },
                70 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.best_lap_index = rf.raw_value.scalar.uint16;
                },
                71 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint16);
                    msg.*.min_altitude = (f / 5) - 500;
                },
                78 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint32);
                    msg.*.active_time = (f / 1000) - 0;
                },
                82 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.player_score = rf.raw_value.scalar.uint16;
                },
                83 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.opponent_score = rf.raw_value.scalar.uint16;
                },
                84 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .string);
                    msg.*.opponent_name = try allocator.dupeSentinel(u8, rf.raw_value.scalar.string, 0);
                },
                85 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.stroke_count = try allocator.alloc(u16, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        msg.*.stroke_count[i] = raw_value.uint16;
                    }
                },
                86 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.zone_count = try allocator.alloc(u16, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        msg.*.zone_count[i] = raw_value.uint16;
                    }
                },
                87 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint16);
                    msg.*.max_ball_speed = (f / 100) - 0;
                },
                88 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint16);
                    msg.*.avg_ball_speed = (f / 100) - 0;
                },
                89 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint16);
                    msg.*.avg_vertical_oscillation = (f / 10) - 0;
                },
                90 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint16);
                    msg.*.avg_stance_time_percent = (f / 100) - 0;
                },
                91 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint16);
                    msg.*.avg_stance_time = (f / 10) - 0;
                },
                92 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint8);
                    msg.*.avg_fractional_cadence = (f / 128) - 0;
                },
                93 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint8);
                    msg.*.max_fractional_cadence = (f / 128) - 0;
                },
                94 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint8);
                    msg.*.total_fractional_cycles = (f / 128) - 0;
                },
                95 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.avg_total_hemoglobin_conc = try allocator.alloc(f32, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        const f: f32 = @floatFromInt(raw_value.uint16);
                        msg.*.avg_total_hemoglobin_conc.?[i] = (f / 100) - 0;
                    }
                },
                96 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.min_total_hemoglobin_conc = try allocator.alloc(f32, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        const f: f32 = @floatFromInt(raw_value.uint16);
                        msg.*.min_total_hemoglobin_conc.?[i] = (f / 100) - 0;
                    }
                },
                97 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.max_total_hemoglobin_conc = try allocator.alloc(f32, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        const f: f32 = @floatFromInt(raw_value.uint16);
                        msg.*.max_total_hemoglobin_conc.?[i] = (f / 100) - 0;
                    }
                },
                98 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.avg_saturated_hemoglobin_percent = try allocator.alloc(f32, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        const f: f32 = @floatFromInt(raw_value.uint16);
                        msg.*.avg_saturated_hemoglobin_percent.?[i] = (f / 10) - 0;
                    }
                },
                99 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.min_saturated_hemoglobin_percent = try allocator.alloc(f32, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        const f: f32 = @floatFromInt(raw_value.uint16);
                        msg.*.min_saturated_hemoglobin_percent.?[i] = (f / 10) - 0;
                    }
                },
                100 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.max_saturated_hemoglobin_percent = try allocator.alloc(f32, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        const f: f32 = @floatFromInt(raw_value.uint16);
                        msg.*.max_saturated_hemoglobin_percent.?[i] = (f / 10) - 0;
                    }
                },
                101 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint8);
                    msg.*.avg_left_torque_effectiveness = (f / 2) - 0;
                },
                102 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint8);
                    msg.*.avg_right_torque_effectiveness = (f / 2) - 0;
                },
                103 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint8);
                    msg.*.avg_left_pedal_smoothness = (f / 2) - 0;
                },
                104 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint8);
                    msg.*.avg_right_pedal_smoothness = (f / 2) - 0;
                },
                105 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint8);
                    msg.*.avg_combined_pedal_smoothness = (f / 2) - 0;
                },
                110 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .string);
                    msg.*.sport_profile_name = try allocator.dupeSentinel(u8, rf.raw_value.scalar.string, 0);
                },
                111 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.sport_index = rf.raw_value.scalar.uint8;
                },
                112 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint32);
                    msg.*.time_standing = (f / 1000) - 0;
                },
                113 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.stand_count = rf.raw_value.scalar.uint16;
                },
                114 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .sint8);
                    msg.*.avg_left_pco = rf.raw_value.scalar.sint8;
                },
                115 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .sint8);
                    msg.*.avg_right_pco = rf.raw_value.scalar.sint8;
                },
                116 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.avg_left_power_phase = try allocator.alloc(f32, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        const f: f32 = @floatFromInt(raw_value.uint8);
                        msg.*.avg_left_power_phase.?[i] = (f / 0.7111111) - 0;
                    }
                },
                117 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.avg_left_power_phase_peak = try allocator.alloc(f32, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        const f: f32 = @floatFromInt(raw_value.uint8);
                        msg.*.avg_left_power_phase_peak.?[i] = (f / 0.7111111) - 0;
                    }
                },
                118 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.avg_right_power_phase = try allocator.alloc(f32, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        const f: f32 = @floatFromInt(raw_value.uint8);
                        msg.*.avg_right_power_phase.?[i] = (f / 0.7111111) - 0;
                    }
                },
                119 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.avg_right_power_phase_peak = try allocator.alloc(f32, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        const f: f32 = @floatFromInt(raw_value.uint8);
                        msg.*.avg_right_power_phase_peak.?[i] = (f / 0.7111111) - 0;
                    }
                },
                120 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.avg_power_position = try allocator.alloc(u16, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        msg.*.avg_power_position[i] = raw_value.uint16;
                    }
                },
                121 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.max_power_position = try allocator.alloc(u16, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        msg.*.max_power_position[i] = raw_value.uint16;
                    }
                },
                122 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.avg_cadence_position = try allocator.alloc(u8, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        msg.*.avg_cadence_position[i] = raw_value.uint8;
                    }
                },
                123 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.max_cadence_position = try allocator.alloc(u8, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        msg.*.max_cadence_position[i] = raw_value.uint8;
                    }
                },
                124 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint32);
                    msg.*.enhanced_avg_speed = (f / 1000) - 0;
                },
                125 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint32);
                    msg.*.enhanced_max_speed = (f / 1000) - 0;
                },
                126 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint32);
                    msg.*.enhanced_avg_altitude = (f / 5) - 500;
                },
                127 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint32);
                    msg.*.enhanced_min_altitude = (f / 5) - 500;
                },
                128 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint32);
                    msg.*.enhanced_max_altitude = (f / 5) - 500;
                },
                129 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.avg_lev_motor_power = rf.raw_value.scalar.uint16;
                },
                130 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.max_lev_motor_power = rf.raw_value.scalar.uint16;
                },
                131 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint8);
                    msg.*.lev_battery_consumption = (f / 2) - 0;
                },
                132 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint16);
                    msg.*.avg_vertical_ratio = (f / 100) - 0;
                },
                133 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint16);
                    msg.*.avg_stance_time_balance = (f / 100) - 0;
                },
                134 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint16);
                    msg.*.avg_step_length = (f / 10) - 0;
                },
                137 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint8);
                    msg.*.total_anaerobic_training_effect = (f / 10) - 0;
                },
                139 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint16);
                    msg.*.avg_vam = (f / 1000) - 0;
                },
                140 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint32);
                    msg.*.avg_depth = (f / 1000) - 0;
                },
                141 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint32);
                    msg.*.max_depth = (f / 1000) - 0;
                },
                142 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint32);
                    msg.*.surface_interval = (f / 1) - 0;
                },
                143 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint8);
                    msg.*.start_cns = (f / 1) - 0;
                },
                144 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint8);
                    msg.*.end_cns = (f / 1) - 0;
                },
                145 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint16);
                    msg.*.start_n2 = (f / 1) - 0;
                },
                146 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint16);
                    msg.*.end_n2 = (f / 1) - 0;
                },
                147 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.avg_respiration_rate = rf.raw_value.scalar.uint8;
                },
                148 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.max_respiration_rate = rf.raw_value.scalar.uint8;
                },
                149 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.min_respiration_rate = rf.raw_value.scalar.uint8;
                },
                150 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .sint8);
                    msg.*.min_temperature = rf.raw_value.scalar.sint8;
                },
                155 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.o2_toxicity = rf.raw_value.scalar.uint16;
                },
                156 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.dive_number = rf.raw_value.scalar.uint32;
                },
                168 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .sint32);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.sint32);
                    msg.*.training_load_peak = (f / 65536) - 0;
                },
                169 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint16);
                    msg.*.enhanced_avg_respiration_rate = (f / 100) - 0;
                },
                170 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint16);
                    msg.*.enhanced_max_respiration_rate = (f / 100) - 0;
                },
                180 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint16);
                    msg.*.enhanced_min_respiration_rate = (f / 100) - 0;
                },
                181 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .float32);
                    msg.*.total_grit = rf.raw_value.scalar.float32;
                },
                182 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .float32);
                    msg.*.total_flow = rf.raw_value.scalar.float32;
                },
                183 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.jump_count = rf.raw_value.scalar.uint16;
                },
                186 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .float32);
                    msg.*.avg_grit = rf.raw_value.scalar.float32;
                },
                187 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .float32);
                    msg.*.avg_flow = rf.raw_value.scalar.float32;
                },
                192 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.workout_feel = rf.raw_value.scalar.uint8;
                },
                193 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.workout_rpe = rf.raw_value.scalar.uint8;
                },
                194 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.avg_spo2 = rf.raw_value.scalar.uint8;
                },
                195 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.avg_stress = rf.raw_value.scalar.uint8;
                },
                196 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.metabolic_calories = rf.raw_value.scalar.uint16;
                },
                197 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.sdrr_hrv = rf.raw_value.scalar.uint8;
                },
                198 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.rmssd_hrv = rf.raw_value.scalar.uint8;
                },
                199 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint8);
                    msg.*.total_fractional_ascent = (f / 100) - 0;
                },
                200 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint8);
                    msg.*.total_fractional_descent = (f / 100) - 0;
                },
                208 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint16);
                    msg.*.avg_core_temperature = (f / 100) - 0;
                },
                209 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint16);
                    msg.*.min_core_temperature = (f / 100) - 0;
                },
                210 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint16);
                    msg.*.max_core_temperature = (f / 100) - 0;
                },
                else => {},
            }
        }
    }

    pub fn deinit(msg: SessionMessage, allocator: std.mem.Allocator) void {
        if (msg.time_in_hr_zone != null and msg.time_in_hr_zone.?.len > 0) {
            allocator.free(msg.time_in_hr_zone.?);
        }
        if (msg.time_in_speed_zone != null and msg.time_in_speed_zone.?.len > 0) {
            allocator.free(msg.time_in_speed_zone.?);
        }
        if (msg.time_in_cadence_zone != null and msg.time_in_cadence_zone.?.len > 0) {
            allocator.free(msg.time_in_cadence_zone.?);
        }
        if (msg.time_in_power_zone != null and msg.time_in_power_zone.?.len > 0) {
            allocator.free(msg.time_in_power_zone.?);
        }
        if (msg.opponent_name != null and msg.opponent_name.?.len > 0) {
            allocator.free(msg.opponent_name.?);
        }
        if (msg.stroke_count != null and msg.stroke_count.?.len > 0) {
            allocator.free(msg.stroke_count.?);
        }
        if (msg.zone_count != null and msg.zone_count.?.len > 0) {
            allocator.free(msg.zone_count.?);
        }
        if (msg.avg_total_hemoglobin_conc != null and msg.avg_total_hemoglobin_conc.?.len > 0) {
            allocator.free(msg.avg_total_hemoglobin_conc.?);
        }
        if (msg.min_total_hemoglobin_conc != null and msg.min_total_hemoglobin_conc.?.len > 0) {
            allocator.free(msg.min_total_hemoglobin_conc.?);
        }
        if (msg.max_total_hemoglobin_conc != null and msg.max_total_hemoglobin_conc.?.len > 0) {
            allocator.free(msg.max_total_hemoglobin_conc.?);
        }
        if (msg.avg_saturated_hemoglobin_percent != null and msg.avg_saturated_hemoglobin_percent.?.len > 0) {
            allocator.free(msg.avg_saturated_hemoglobin_percent.?);
        }
        if (msg.min_saturated_hemoglobin_percent != null and msg.min_saturated_hemoglobin_percent.?.len > 0) {
            allocator.free(msg.min_saturated_hemoglobin_percent.?);
        }
        if (msg.max_saturated_hemoglobin_percent != null and msg.max_saturated_hemoglobin_percent.?.len > 0) {
            allocator.free(msg.max_saturated_hemoglobin_percent.?);
        }
        if (msg.sport_profile_name != null and msg.sport_profile_name.?.len > 0) {
            allocator.free(msg.sport_profile_name.?);
        }
        if (msg.avg_left_power_phase != null and msg.avg_left_power_phase.?.len > 0) {
            allocator.free(msg.avg_left_power_phase.?);
        }
        if (msg.avg_left_power_phase_peak != null and msg.avg_left_power_phase_peak.?.len > 0) {
            allocator.free(msg.avg_left_power_phase_peak.?);
        }
        if (msg.avg_right_power_phase != null and msg.avg_right_power_phase.?.len > 0) {
            allocator.free(msg.avg_right_power_phase.?);
        }
        if (msg.avg_right_power_phase_peak != null and msg.avg_right_power_phase_peak.?.len > 0) {
            allocator.free(msg.avg_right_power_phase_peak.?);
        }
        if (msg.avg_power_position != null and msg.avg_power_position.?.len > 0) {
            allocator.free(msg.avg_power_position.?);
        }
        if (msg.max_power_position != null and msg.max_power_position.?.len > 0) {
            allocator.free(msg.max_power_position.?);
        }
        if (msg.avg_cadence_position != null and msg.avg_cadence_position.?.len > 0) {
            allocator.free(msg.avg_cadence_position.?);
        }
        if (msg.max_cadence_position != null and msg.max_cadence_position.?.len > 0) {
            allocator.free(msg.max_cadence_position.?);
        }
    }
};

pub const LapMessage = struct {
    message_index: ?MessageIndex = null,
    timestamp: ?u32 = null,
    event: ?Event = null,
    event_type: ?EventType = null,
    start_time: ?u32 = null,
    start_position_lat: ?i32 = null,
    start_position_long: ?i32 = null,
    end_position_lat: ?i32 = null,
    end_position_long: ?i32 = null,
    /// Time (includes pauses)
    total_elapsed_time: ?f32 = null,
    /// Timer Time (excludes pauses)
    total_timer_time: ?f32 = null,
    total_distance: ?f32 = null,
    total_calories: ?u16 = null,
    /// If New Leaf
    total_fat_calories: ?u16 = null,
    avg_speed: ?f32 = null,
    max_speed: ?f32 = null,
    avg_heart_rate: ?u8 = null,
    max_heart_rate: ?u8 = null,
    /// total_power / total_timer_time if non_zero_avg_power otherwise total_power / total_elapsed_time
    avg_power: ?u16 = null,
    max_power: ?u16 = null,
    total_ascent: ?u16 = null,
    total_descent: ?u16 = null,
    intensity: ?Intensity = null,
    lap_trigger: ?LapTrigger = null,
    sport: ?Sport = null,
    event_group: ?u8 = null,
    /// # of lengths of swim pool
    num_lengths: ?u16 = null,
    normalized_power: ?u16 = null,
    left_right_balance: ?LeftRightBalance100 = null,
    first_length_index: ?u16 = null,
    avg_stroke_distance: ?f32 = null,
    swim_stroke: ?SwimStroke = null,
    sub_sport: ?SubSport = null,
    /// # of active lengths of swim pool
    num_active_lengths: ?u16 = null,
    total_work: ?u32 = null,
    avg_altitude: ?f32 = null,
    max_altitude: ?f32 = null,
    gps_accuracy: ?u8 = null,
    avg_grade: ?f32 = null,
    avg_pos_grade: ?f32 = null,
    avg_neg_grade: ?f32 = null,
    max_pos_grade: ?f32 = null,
    max_neg_grade: ?f32 = null,
    avg_temperature: ?i8 = null,
    max_temperature: ?i8 = null,
    total_moving_time: ?f32 = null,
    avg_pos_vertical_speed: ?f32 = null,
    avg_neg_vertical_speed: ?f32 = null,
    max_pos_vertical_speed: ?f32 = null,
    max_neg_vertical_speed: ?f32 = null,
    time_in_hr_zone: ?[]f32 = null,
    time_in_speed_zone: ?[]f32 = null,
    time_in_cadence_zone: ?[]f32 = null,
    time_in_power_zone: ?[]f32 = null,
    repetition_num: ?u16 = null,
    min_altitude: ?f32 = null,
    min_heart_rate: ?u8 = null,
    active_time: ?f32 = null,
    wkt_step_index: ?MessageIndex = null,
    opponent_score: ?u16 = null,
    /// stroke_type enum used as the index
    stroke_count: ?[]u16 = null,
    /// zone number used as the index
    zone_count: ?[]u16 = null,
    avg_vertical_oscillation: ?f32 = null,
    avg_stance_time_percent: ?f32 = null,
    avg_stance_time: ?f32 = null,
    /// fractional part of the avg_cadence
    avg_fractional_cadence: ?f32 = null,
    /// fractional part of the max_cadence
    max_fractional_cadence: ?f32 = null,
    /// fractional part of the total_cycles
    total_fractional_cycles: ?f32 = null,
    player_score: ?u16 = null,
    /// Avg saturated and unsaturated hemoglobin
    avg_total_hemoglobin_conc: ?[]f32 = null,
    /// Min saturated and unsaturated hemoglobin
    min_total_hemoglobin_conc: ?[]f32 = null,
    /// Max saturated and unsaturated hemoglobin
    max_total_hemoglobin_conc: ?[]f32 = null,
    /// Avg percentage of hemoglobin saturated with oxygen
    avg_saturated_hemoglobin_percent: ?[]f32 = null,
    /// Min percentage of hemoglobin saturated with oxygen
    min_saturated_hemoglobin_percent: ?[]f32 = null,
    /// Max percentage of hemoglobin saturated with oxygen
    max_saturated_hemoglobin_percent: ?[]f32 = null,
    avg_left_torque_effectiveness: ?f32 = null,
    avg_right_torque_effectiveness: ?f32 = null,
    avg_left_pedal_smoothness: ?f32 = null,
    avg_right_pedal_smoothness: ?f32 = null,
    avg_combined_pedal_smoothness: ?f32 = null,
    /// Total time spent in the standing position
    time_standing: ?f32 = null,
    /// Number of transitions to the standing state
    stand_count: ?u16 = null,
    /// Average left platform center offset
    avg_left_pco: ?i8 = null,
    /// Average right platform center offset
    avg_right_pco: ?i8 = null,
    /// Average left power phase angles. Data value indexes defined by power_phase_type.
    avg_left_power_phase: ?[]f32 = null,
    /// Average left power phase peak angles. Data value indexes defined by power_phase_type.
    avg_left_power_phase_peak: ?[]f32 = null,
    /// Average right power phase angles. Data value indexes defined by power_phase_type.
    avg_right_power_phase: ?[]f32 = null,
    /// Average right power phase peak angles. Data value indexes defined by power_phase_type.
    avg_right_power_phase_peak: ?[]f32 = null,
    /// Average power by position. Data value indexes defined by rider_position_type.
    avg_power_position: ?[]u16 = null,
    /// Maximum power by position. Data value indexes defined by rider_position_type.
    max_power_position: ?[]u16 = null,
    /// Average cadence by position. Data value indexes defined by rider_position_type.
    avg_cadence_position: ?[]u8 = null,
    /// Maximum cadence by position. Data value indexes defined by rider_position_type.
    max_cadence_position: ?[]u8 = null,
    enhanced_avg_speed: ?f32 = null,
    enhanced_max_speed: ?f32 = null,
    enhanced_avg_altitude: ?f32 = null,
    enhanced_min_altitude: ?f32 = null,
    enhanced_max_altitude: ?f32 = null,
    /// lev average motor power during lap
    avg_lev_motor_power: ?u16 = null,
    /// lev maximum motor power during lap
    max_lev_motor_power: ?u16 = null,
    /// lev battery consumption during lap
    lev_battery_consumption: ?f32 = null,
    avg_vertical_ratio: ?f32 = null,
    avg_stance_time_balance: ?f32 = null,
    avg_step_length: ?f32 = null,
    avg_vam: ?f32 = null,
    /// 0 if above water
    avg_depth: ?f32 = null,
    /// 0 if above water
    max_depth: ?f32 = null,
    min_temperature: ?i8 = null,
    enhanced_avg_respiration_rate: ?f32 = null,
    enhanced_max_respiration_rate: ?f32 = null,
    avg_respiration_rate: ?u8 = null,
    max_respiration_rate: ?u8 = null,
    /// The grit score estimates how challenging a route could be for a cyclist in terms of time spent going over sharp turns or large grade slopes.
    total_grit: ?f32 = null,
    /// The flow score estimates how long distance wise a cyclist deaccelerates over intervals where deacceleration is unnecessary such as smooth turns or small grade angle intervals.
    total_flow: ?f32 = null,
    jump_count: ?u16 = null,
    /// The grit score estimates how challenging a route could be for a cyclist in terms of time spent going over sharp turns or large grade slopes.
    avg_grit: ?f32 = null,
    /// The flow score estimates how long distance wise a cyclist deaccelerates over intervals where deacceleration is unnecessary such as smooth turns or small grade angle intervals.
    avg_flow: ?f32 = null,
    /// fractional part of total_ascent
    total_fractional_ascent: ?f32 = null,
    /// fractional part of total_descent
    total_fractional_descent: ?f32 = null,
    avg_core_temperature: ?f32 = null,
    min_core_temperature: ?f32 = null,
    max_core_temperature: ?f32 = null,

    pub fn fromRawFields(msg: *LapMessage, raw_fields: []const decoder.FieldData, allocator: std.mem.Allocator) !void {
        msg.* = .{};
        for (raw_fields) |rf| {
            switch (rf.id) {
                254 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.message_index = @enumFromInt(rf.raw_value.scalar.uint16);
                },
                253 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.timestamp = rf.raw_value.scalar.uint32;
                },
                0 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.event = @enumFromInt(rf.raw_value.scalar.enumeration);
                },
                1 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.event_type = @enumFromInt(rf.raw_value.scalar.enumeration);
                },
                2 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.start_time = rf.raw_value.scalar.uint32;
                },
                3 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .sint32);
                    msg.*.start_position_lat = rf.raw_value.scalar.sint32;
                },
                4 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .sint32);
                    msg.*.start_position_long = rf.raw_value.scalar.sint32;
                },
                5 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .sint32);
                    msg.*.end_position_lat = rf.raw_value.scalar.sint32;
                },
                6 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .sint32);
                    msg.*.end_position_long = rf.raw_value.scalar.sint32;
                },
                7 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint32);
                    msg.*.total_elapsed_time = (f / 1000) - 0;
                },
                8 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint32);
                    msg.*.total_timer_time = (f / 1000) - 0;
                },
                9 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint32);
                    msg.*.total_distance = (f / 100) - 0;
                },
                11 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.total_calories = rf.raw_value.scalar.uint16;
                },
                12 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.total_fat_calories = rf.raw_value.scalar.uint16;
                },
                13 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint16);
                    msg.*.avg_speed = (f / 1000) - 0;
                },
                14 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint16);
                    msg.*.max_speed = (f / 1000) - 0;
                },
                15 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.avg_heart_rate = rf.raw_value.scalar.uint8;
                },
                16 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.max_heart_rate = rf.raw_value.scalar.uint8;
                },
                19 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.avg_power = rf.raw_value.scalar.uint16;
                },
                20 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.max_power = rf.raw_value.scalar.uint16;
                },
                21 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.total_ascent = rf.raw_value.scalar.uint16;
                },
                22 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.total_descent = rf.raw_value.scalar.uint16;
                },
                23 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.intensity = @enumFromInt(rf.raw_value.scalar.enumeration);
                },
                24 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.lap_trigger = @enumFromInt(rf.raw_value.scalar.enumeration);
                },
                25 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.sport = @enumFromInt(rf.raw_value.scalar.enumeration);
                },
                26 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.event_group = rf.raw_value.scalar.uint8;
                },
                32 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.num_lengths = rf.raw_value.scalar.uint16;
                },
                33 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.normalized_power = rf.raw_value.scalar.uint16;
                },
                34 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.left_right_balance = @enumFromInt(rf.raw_value.scalar.uint16);
                },
                35 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.first_length_index = rf.raw_value.scalar.uint16;
                },
                37 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint16);
                    msg.*.avg_stroke_distance = (f / 100) - 0;
                },
                38 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.swim_stroke = @enumFromInt(rf.raw_value.scalar.enumeration);
                },
                39 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.sub_sport = @enumFromInt(rf.raw_value.scalar.enumeration);
                },
                40 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.num_active_lengths = rf.raw_value.scalar.uint16;
                },
                41 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.total_work = rf.raw_value.scalar.uint32;
                },
                42 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint16);
                    msg.*.avg_altitude = (f / 5) - 500;
                },
                43 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint16);
                    msg.*.max_altitude = (f / 5) - 500;
                },
                44 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.gps_accuracy = rf.raw_value.scalar.uint8;
                },
                45 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .sint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.sint16);
                    msg.*.avg_grade = (f / 100) - 0;
                },
                46 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .sint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.sint16);
                    msg.*.avg_pos_grade = (f / 100) - 0;
                },
                47 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .sint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.sint16);
                    msg.*.avg_neg_grade = (f / 100) - 0;
                },
                48 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .sint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.sint16);
                    msg.*.max_pos_grade = (f / 100) - 0;
                },
                49 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .sint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.sint16);
                    msg.*.max_neg_grade = (f / 100) - 0;
                },
                50 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .sint8);
                    msg.*.avg_temperature = rf.raw_value.scalar.sint8;
                },
                51 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .sint8);
                    msg.*.max_temperature = rf.raw_value.scalar.sint8;
                },
                52 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint32);
                    msg.*.total_moving_time = (f / 1000) - 0;
                },
                53 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .sint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.sint16);
                    msg.*.avg_pos_vertical_speed = (f / 1000) - 0;
                },
                54 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .sint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.sint16);
                    msg.*.avg_neg_vertical_speed = (f / 1000) - 0;
                },
                55 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .sint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.sint16);
                    msg.*.max_pos_vertical_speed = (f / 1000) - 0;
                },
                56 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .sint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.sint16);
                    msg.*.max_neg_vertical_speed = (f / 1000) - 0;
                },
                57 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.time_in_hr_zone = try allocator.alloc(f32, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        const f: f32 = @floatFromInt(raw_value.uint32);
                        msg.*.time_in_hr_zone.?[i] = (f / 1000) - 0;
                    }
                },
                58 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.time_in_speed_zone = try allocator.alloc(f32, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        const f: f32 = @floatFromInt(raw_value.uint32);
                        msg.*.time_in_speed_zone.?[i] = (f / 1000) - 0;
                    }
                },
                59 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.time_in_cadence_zone = try allocator.alloc(f32, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        const f: f32 = @floatFromInt(raw_value.uint32);
                        msg.*.time_in_cadence_zone.?[i] = (f / 1000) - 0;
                    }
                },
                60 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.time_in_power_zone = try allocator.alloc(f32, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        const f: f32 = @floatFromInt(raw_value.uint32);
                        msg.*.time_in_power_zone.?[i] = (f / 1000) - 0;
                    }
                },
                61 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.repetition_num = rf.raw_value.scalar.uint16;
                },
                62 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint16);
                    msg.*.min_altitude = (f / 5) - 500;
                },
                63 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.min_heart_rate = rf.raw_value.scalar.uint8;
                },
                70 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint32);
                    msg.*.active_time = (f / 1000) - 0;
                },
                71 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.wkt_step_index = @enumFromInt(rf.raw_value.scalar.uint16);
                },
                74 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.opponent_score = rf.raw_value.scalar.uint16;
                },
                75 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.stroke_count = try allocator.alloc(u16, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        msg.*.stroke_count[i] = raw_value.uint16;
                    }
                },
                76 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.zone_count = try allocator.alloc(u16, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        msg.*.zone_count[i] = raw_value.uint16;
                    }
                },
                77 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint16);
                    msg.*.avg_vertical_oscillation = (f / 10) - 0;
                },
                78 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint16);
                    msg.*.avg_stance_time_percent = (f / 100) - 0;
                },
                79 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint16);
                    msg.*.avg_stance_time = (f / 10) - 0;
                },
                80 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint8);
                    msg.*.avg_fractional_cadence = (f / 128) - 0;
                },
                81 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint8);
                    msg.*.max_fractional_cadence = (f / 128) - 0;
                },
                82 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint8);
                    msg.*.total_fractional_cycles = (f / 128) - 0;
                },
                83 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.player_score = rf.raw_value.scalar.uint16;
                },
                84 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.avg_total_hemoglobin_conc = try allocator.alloc(f32, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        const f: f32 = @floatFromInt(raw_value.uint16);
                        msg.*.avg_total_hemoglobin_conc.?[i] = (f / 100) - 0;
                    }
                },
                85 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.min_total_hemoglobin_conc = try allocator.alloc(f32, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        const f: f32 = @floatFromInt(raw_value.uint16);
                        msg.*.min_total_hemoglobin_conc.?[i] = (f / 100) - 0;
                    }
                },
                86 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.max_total_hemoglobin_conc = try allocator.alloc(f32, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        const f: f32 = @floatFromInt(raw_value.uint16);
                        msg.*.max_total_hemoglobin_conc.?[i] = (f / 100) - 0;
                    }
                },
                87 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.avg_saturated_hemoglobin_percent = try allocator.alloc(f32, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        const f: f32 = @floatFromInt(raw_value.uint16);
                        msg.*.avg_saturated_hemoglobin_percent.?[i] = (f / 10) - 0;
                    }
                },
                88 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.min_saturated_hemoglobin_percent = try allocator.alloc(f32, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        const f: f32 = @floatFromInt(raw_value.uint16);
                        msg.*.min_saturated_hemoglobin_percent.?[i] = (f / 10) - 0;
                    }
                },
                89 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.max_saturated_hemoglobin_percent = try allocator.alloc(f32, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        const f: f32 = @floatFromInt(raw_value.uint16);
                        msg.*.max_saturated_hemoglobin_percent.?[i] = (f / 10) - 0;
                    }
                },
                91 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint8);
                    msg.*.avg_left_torque_effectiveness = (f / 2) - 0;
                },
                92 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint8);
                    msg.*.avg_right_torque_effectiveness = (f / 2) - 0;
                },
                93 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint8);
                    msg.*.avg_left_pedal_smoothness = (f / 2) - 0;
                },
                94 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint8);
                    msg.*.avg_right_pedal_smoothness = (f / 2) - 0;
                },
                95 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint8);
                    msg.*.avg_combined_pedal_smoothness = (f / 2) - 0;
                },
                98 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint32);
                    msg.*.time_standing = (f / 1000) - 0;
                },
                99 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.stand_count = rf.raw_value.scalar.uint16;
                },
                100 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .sint8);
                    msg.*.avg_left_pco = rf.raw_value.scalar.sint8;
                },
                101 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .sint8);
                    msg.*.avg_right_pco = rf.raw_value.scalar.sint8;
                },
                102 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.avg_left_power_phase = try allocator.alloc(f32, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        const f: f32 = @floatFromInt(raw_value.uint8);
                        msg.*.avg_left_power_phase.?[i] = (f / 0.7111111) - 0;
                    }
                },
                103 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.avg_left_power_phase_peak = try allocator.alloc(f32, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        const f: f32 = @floatFromInt(raw_value.uint8);
                        msg.*.avg_left_power_phase_peak.?[i] = (f / 0.7111111) - 0;
                    }
                },
                104 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.avg_right_power_phase = try allocator.alloc(f32, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        const f: f32 = @floatFromInt(raw_value.uint8);
                        msg.*.avg_right_power_phase.?[i] = (f / 0.7111111) - 0;
                    }
                },
                105 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.avg_right_power_phase_peak = try allocator.alloc(f32, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        const f: f32 = @floatFromInt(raw_value.uint8);
                        msg.*.avg_right_power_phase_peak.?[i] = (f / 0.7111111) - 0;
                    }
                },
                106 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.avg_power_position = try allocator.alloc(u16, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        msg.*.avg_power_position[i] = raw_value.uint16;
                    }
                },
                107 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.max_power_position = try allocator.alloc(u16, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        msg.*.max_power_position[i] = raw_value.uint16;
                    }
                },
                108 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.avg_cadence_position = try allocator.alloc(u8, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        msg.*.avg_cadence_position[i] = raw_value.uint8;
                    }
                },
                109 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.max_cadence_position = try allocator.alloc(u8, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        msg.*.max_cadence_position[i] = raw_value.uint8;
                    }
                },
                110 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint32);
                    msg.*.enhanced_avg_speed = (f / 1000) - 0;
                },
                111 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint32);
                    msg.*.enhanced_max_speed = (f / 1000) - 0;
                },
                112 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint32);
                    msg.*.enhanced_avg_altitude = (f / 5) - 500;
                },
                113 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint32);
                    msg.*.enhanced_min_altitude = (f / 5) - 500;
                },
                114 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint32);
                    msg.*.enhanced_max_altitude = (f / 5) - 500;
                },
                115 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.avg_lev_motor_power = rf.raw_value.scalar.uint16;
                },
                116 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.max_lev_motor_power = rf.raw_value.scalar.uint16;
                },
                117 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint8);
                    msg.*.lev_battery_consumption = (f / 2) - 0;
                },
                118 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint16);
                    msg.*.avg_vertical_ratio = (f / 100) - 0;
                },
                119 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint16);
                    msg.*.avg_stance_time_balance = (f / 100) - 0;
                },
                120 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint16);
                    msg.*.avg_step_length = (f / 10) - 0;
                },
                121 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint16);
                    msg.*.avg_vam = (f / 1000) - 0;
                },
                122 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint32);
                    msg.*.avg_depth = (f / 1000) - 0;
                },
                123 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint32);
                    msg.*.max_depth = (f / 1000) - 0;
                },
                124 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .sint8);
                    msg.*.min_temperature = rf.raw_value.scalar.sint8;
                },
                136 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint16);
                    msg.*.enhanced_avg_respiration_rate = (f / 100) - 0;
                },
                137 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint16);
                    msg.*.enhanced_max_respiration_rate = (f / 100) - 0;
                },
                147 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.avg_respiration_rate = rf.raw_value.scalar.uint8;
                },
                148 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.max_respiration_rate = rf.raw_value.scalar.uint8;
                },
                149 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .float32);
                    msg.*.total_grit = rf.raw_value.scalar.float32;
                },
                150 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .float32);
                    msg.*.total_flow = rf.raw_value.scalar.float32;
                },
                151 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.jump_count = rf.raw_value.scalar.uint16;
                },
                153 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .float32);
                    msg.*.avg_grit = rf.raw_value.scalar.float32;
                },
                154 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .float32);
                    msg.*.avg_flow = rf.raw_value.scalar.float32;
                },
                156 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint8);
                    msg.*.total_fractional_ascent = (f / 100) - 0;
                },
                157 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint8);
                    msg.*.total_fractional_descent = (f / 100) - 0;
                },
                158 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint16);
                    msg.*.avg_core_temperature = (f / 100) - 0;
                },
                159 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint16);
                    msg.*.min_core_temperature = (f / 100) - 0;
                },
                160 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint16);
                    msg.*.max_core_temperature = (f / 100) - 0;
                },
                else => {},
            }
        }
    }

    pub fn deinit(msg: LapMessage, allocator: std.mem.Allocator) void {
        if (msg.time_in_hr_zone != null and msg.time_in_hr_zone.?.len > 0) {
            allocator.free(msg.time_in_hr_zone.?);
        }
        if (msg.time_in_speed_zone != null and msg.time_in_speed_zone.?.len > 0) {
            allocator.free(msg.time_in_speed_zone.?);
        }
        if (msg.time_in_cadence_zone != null and msg.time_in_cadence_zone.?.len > 0) {
            allocator.free(msg.time_in_cadence_zone.?);
        }
        if (msg.time_in_power_zone != null and msg.time_in_power_zone.?.len > 0) {
            allocator.free(msg.time_in_power_zone.?);
        }
        if (msg.stroke_count != null and msg.stroke_count.?.len > 0) {
            allocator.free(msg.stroke_count.?);
        }
        if (msg.zone_count != null and msg.zone_count.?.len > 0) {
            allocator.free(msg.zone_count.?);
        }
        if (msg.avg_total_hemoglobin_conc != null and msg.avg_total_hemoglobin_conc.?.len > 0) {
            allocator.free(msg.avg_total_hemoglobin_conc.?);
        }
        if (msg.min_total_hemoglobin_conc != null and msg.min_total_hemoglobin_conc.?.len > 0) {
            allocator.free(msg.min_total_hemoglobin_conc.?);
        }
        if (msg.max_total_hemoglobin_conc != null and msg.max_total_hemoglobin_conc.?.len > 0) {
            allocator.free(msg.max_total_hemoglobin_conc.?);
        }
        if (msg.avg_saturated_hemoglobin_percent != null and msg.avg_saturated_hemoglobin_percent.?.len > 0) {
            allocator.free(msg.avg_saturated_hemoglobin_percent.?);
        }
        if (msg.min_saturated_hemoglobin_percent != null and msg.min_saturated_hemoglobin_percent.?.len > 0) {
            allocator.free(msg.min_saturated_hemoglobin_percent.?);
        }
        if (msg.max_saturated_hemoglobin_percent != null and msg.max_saturated_hemoglobin_percent.?.len > 0) {
            allocator.free(msg.max_saturated_hemoglobin_percent.?);
        }
        if (msg.avg_left_power_phase != null and msg.avg_left_power_phase.?.len > 0) {
            allocator.free(msg.avg_left_power_phase.?);
        }
        if (msg.avg_left_power_phase_peak != null and msg.avg_left_power_phase_peak.?.len > 0) {
            allocator.free(msg.avg_left_power_phase_peak.?);
        }
        if (msg.avg_right_power_phase != null and msg.avg_right_power_phase.?.len > 0) {
            allocator.free(msg.avg_right_power_phase.?);
        }
        if (msg.avg_right_power_phase_peak != null and msg.avg_right_power_phase_peak.?.len > 0) {
            allocator.free(msg.avg_right_power_phase_peak.?);
        }
        if (msg.avg_power_position != null and msg.avg_power_position.?.len > 0) {
            allocator.free(msg.avg_power_position.?);
        }
        if (msg.max_power_position != null and msg.max_power_position.?.len > 0) {
            allocator.free(msg.max_power_position.?);
        }
        if (msg.avg_cadence_position != null and msg.avg_cadence_position.?.len > 0) {
            allocator.free(msg.avg_cadence_position.?);
        }
        if (msg.max_cadence_position != null and msg.max_cadence_position.?.len > 0) {
            allocator.free(msg.max_cadence_position.?);
        }
    }
};

pub const LengthMessage = struct {
    message_index: ?MessageIndex = null,
    timestamp: ?u32 = null,
    event: ?Event = null,
    event_type: ?EventType = null,
    start_time: ?u32 = null,
    total_elapsed_time: ?f32 = null,
    total_timer_time: ?f32 = null,
    total_strokes: ?u16 = null,
    avg_speed: ?f32 = null,
    swim_stroke: ?SwimStroke = null,
    avg_swimming_cadence: ?u8 = null,
    event_group: ?u8 = null,
    total_calories: ?u16 = null,
    length_type: ?LengthType = null,
    player_score: ?u16 = null,
    opponent_score: ?u16 = null,
    /// stroke_type enum used as the index
    stroke_count: ?[]u16 = null,
    /// zone number used as the index
    zone_count: ?[]u16 = null,
    enhanced_avg_respiration_rate: ?f32 = null,
    enhanced_max_respiration_rate: ?f32 = null,
    avg_respiration_rate: ?u8 = null,
    max_respiration_rate: ?u8 = null,

    pub fn fromRawFields(msg: *LengthMessage, raw_fields: []const decoder.FieldData, allocator: std.mem.Allocator) !void {
        msg.* = .{};
        for (raw_fields) |rf| {
            switch (rf.id) {
                254 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.message_index = @enumFromInt(rf.raw_value.scalar.uint16);
                },
                253 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.timestamp = rf.raw_value.scalar.uint32;
                },
                0 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.event = @enumFromInt(rf.raw_value.scalar.enumeration);
                },
                1 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.event_type = @enumFromInt(rf.raw_value.scalar.enumeration);
                },
                2 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.start_time = rf.raw_value.scalar.uint32;
                },
                3 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint32);
                    msg.*.total_elapsed_time = (f / 1000) - 0;
                },
                4 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint32);
                    msg.*.total_timer_time = (f / 1000) - 0;
                },
                5 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.total_strokes = rf.raw_value.scalar.uint16;
                },
                6 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint16);
                    msg.*.avg_speed = (f / 1000) - 0;
                },
                7 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.swim_stroke = @enumFromInt(rf.raw_value.scalar.enumeration);
                },
                9 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.avg_swimming_cadence = rf.raw_value.scalar.uint8;
                },
                10 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.event_group = rf.raw_value.scalar.uint8;
                },
                11 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.total_calories = rf.raw_value.scalar.uint16;
                },
                12 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.length_type = @enumFromInt(rf.raw_value.scalar.enumeration);
                },
                18 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.player_score = rf.raw_value.scalar.uint16;
                },
                19 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.opponent_score = rf.raw_value.scalar.uint16;
                },
                20 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.stroke_count = try allocator.alloc(u16, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        msg.*.stroke_count[i] = raw_value.uint16;
                    }
                },
                21 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.zone_count = try allocator.alloc(u16, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        msg.*.zone_count[i] = raw_value.uint16;
                    }
                },
                22 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint16);
                    msg.*.enhanced_avg_respiration_rate = (f / 100) - 0;
                },
                23 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint16);
                    msg.*.enhanced_max_respiration_rate = (f / 100) - 0;
                },
                24 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.avg_respiration_rate = rf.raw_value.scalar.uint8;
                },
                25 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.max_respiration_rate = rf.raw_value.scalar.uint8;
                },
                else => {},
            }
        }
    }

    pub fn deinit(msg: LengthMessage, allocator: std.mem.Allocator) void {
        if (msg.stroke_count != null and msg.stroke_count.?.len > 0) {
            allocator.free(msg.stroke_count.?);
        }
        if (msg.zone_count != null and msg.zone_count.?.len > 0) {
            allocator.free(msg.zone_count.?);
        }
    }
};

pub const RecordMessage = struct {
    timestamp: ?u32 = null,
    position_lat: ?i32 = null,
    position_long: ?i32 = null,
    altitude: ?f32 = null,
    heart_rate: ?u8 = null,
    cadence: ?u8 = null,
    distance: ?f32 = null,
    speed: ?f32 = null,
    power: ?u16 = null,
    grade: ?f32 = null,
    /// Relative. 0 is none 254 is Max.
    resistance: ?u8 = null,
    time_from_course: ?f32 = null,
    cycle_length: ?f32 = null,
    temperature: ?i8 = null,
    /// Speed at 1s intervals. Timestamp field indicates time of last array element.
    speed_1s: ?[]f32 = null,
    cycles: ?u8 = null,
    total_cycles: ?u32 = null,
    compressed_accumulated_power: ?u16 = null,
    accumulated_power: ?u32 = null,
    left_right_balance: ?LeftRightBalance = null,
    gps_accuracy: ?u8 = null,
    vertical_speed: ?f32 = null,
    calories: ?u16 = null,
    vertical_oscillation: ?f32 = null,
    stance_time_percent: ?f32 = null,
    stance_time: ?f32 = null,
    activity_type: ?ActivityType = null,
    left_torque_effectiveness: ?f32 = null,
    right_torque_effectiveness: ?f32 = null,
    left_pedal_smoothness: ?f32 = null,
    right_pedal_smoothness: ?f32 = null,
    combined_pedal_smoothness: ?f32 = null,
    time128: ?f32 = null,
    stroke_type: ?StrokeType = null,
    zone: ?u8 = null,
    ball_speed: ?f32 = null,
    /// Log cadence and fractional cadence for backwards compatability
    cadence256: ?f32 = null,
    fractional_cadence: ?f32 = null,
    /// Total saturated and unsaturated hemoglobin
    total_hemoglobin_conc: ?f32 = null,
    /// Min saturated and unsaturated hemoglobin
    total_hemoglobin_conc_min: ?f32 = null,
    /// Max saturated and unsaturated hemoglobin
    total_hemoglobin_conc_max: ?f32 = null,
    /// Percentage of hemoglobin saturated with oxygen
    saturated_hemoglobin_percent: ?f32 = null,
    /// Min percentage of hemoglobin saturated with oxygen
    saturated_hemoglobin_percent_min: ?f32 = null,
    /// Max percentage of hemoglobin saturated with oxygen
    saturated_hemoglobin_percent_max: ?f32 = null,
    device_index: ?DeviceIndex = null,
    /// Left platform center offset
    left_pco: ?i8 = null,
    /// Right platform center offset
    right_pco: ?i8 = null,
    /// Left power phase angles. Data value indexes defined by power_phase_type.
    left_power_phase: ?[]f32 = null,
    /// Left power phase peak angles. Data value indexes defined by power_phase_type.
    left_power_phase_peak: ?[]f32 = null,
    /// Right power phase angles. Data value indexes defined by power_phase_type.
    right_power_phase: ?[]f32 = null,
    /// Right power phase peak angles. Data value indexes defined by power_phase_type.
    right_power_phase_peak: ?[]f32 = null,
    enhanced_speed: ?f32 = null,
    enhanced_altitude: ?f32 = null,
    /// lev battery state of charge
    battery_soc: ?f32 = null,
    /// lev motor power
    motor_power: ?u16 = null,
    vertical_ratio: ?f32 = null,
    stance_time_balance: ?f32 = null,
    step_length: ?f32 = null,
    /// Supports larger cycle sizes needed for paddlesports. Max cycle size: 655.35
    cycle_length16: ?f32 = null,
    /// Includes atmospheric pressure
    absolute_pressure: ?u32 = null,
    /// 0 if above water
    depth: ?f32 = null,
    /// 0 if above water
    next_stop_depth: ?f32 = null,
    next_stop_time: ?f32 = null,
    time_to_surface: ?f32 = null,
    ndl_time: ?f32 = null,
    cns_load: ?u8 = null,
    n2_load: ?f32 = null,
    respiration_rate: ?f32 = null,
    enhanced_respiration_rate: ?f32 = null,
    /// The grit score estimates how challenging a route could be for a cyclist in terms of time spent going over sharp turns or large grade slopes.
    grit: ?f32 = null,
    /// The flow score estimates how long distance wise a cyclist deaccelerates over intervals where deacceleration is unnecessary such as smooth turns or small grade angle intervals.
    flow: ?f32 = null,
    /// Current Stress value
    current_stress: ?f32 = null,
    ebike_travel_range: ?u16 = null,
    ebike_battery_level: ?u8 = null,
    ebike_assist_mode: ?u8 = null,
    ebike_assist_level_percent: ?u8 = null,
    air_time_remaining: ?u32 = null,
    /// Pressure-based surface air consumption
    pressure_sac: ?f32 = null,
    /// Volumetric surface air consumption
    volume_sac: ?f32 = null,
    /// Respiratory minute volume
    rmv: ?f32 = null,
    ascent_rate: ?f32 = null,
    /// Current partial pressure of oxygen
    po2: ?f32 = null,
    core_temperature: ?f32 = null,

    pub fn fromRawFields(msg: *RecordMessage, raw_fields: []const decoder.FieldData, allocator: std.mem.Allocator) !void {
        msg.* = .{};
        for (raw_fields) |rf| {
            switch (rf.id) {
                253 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.timestamp = rf.raw_value.scalar.uint32;
                },
                0 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .sint32);
                    msg.*.position_lat = rf.raw_value.scalar.sint32;
                },
                1 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .sint32);
                    msg.*.position_long = rf.raw_value.scalar.sint32;
                },
                2 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint16);
                    msg.*.altitude = (f / 5) - 500;
                },
                3 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.heart_rate = rf.raw_value.scalar.uint8;
                },
                4 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.cadence = rf.raw_value.scalar.uint8;
                },
                5 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint32);
                    msg.*.distance = (f / 100) - 0;
                },
                6 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint16);
                    msg.*.speed = (f / 1000) - 0;
                },
                7 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.power = rf.raw_value.scalar.uint16;
                },
                9 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .sint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.sint16);
                    msg.*.grade = (f / 100) - 0;
                },
                10 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.resistance = rf.raw_value.scalar.uint8;
                },
                11 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .sint32);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.sint32);
                    msg.*.time_from_course = (f / 1000) - 0;
                },
                12 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint8);
                    msg.*.cycle_length = (f / 100) - 0;
                },
                13 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .sint8);
                    msg.*.temperature = rf.raw_value.scalar.sint8;
                },
                17 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.speed_1s = try allocator.alloc(f32, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        const f: f32 = @floatFromInt(raw_value.uint8);
                        msg.*.speed_1s.?[i] = (f / 16) - 0;
                    }
                },
                18 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.cycles = rf.raw_value.scalar.uint8;
                },
                19 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.total_cycles = rf.raw_value.scalar.uint32;
                },
                28 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.compressed_accumulated_power = rf.raw_value.scalar.uint16;
                },
                29 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.accumulated_power = rf.raw_value.scalar.uint32;
                },
                30 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.left_right_balance = @enumFromInt(rf.raw_value.scalar.uint8);
                },
                31 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.gps_accuracy = rf.raw_value.scalar.uint8;
                },
                32 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .sint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.sint16);
                    msg.*.vertical_speed = (f / 1000) - 0;
                },
                33 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.calories = rf.raw_value.scalar.uint16;
                },
                39 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint16);
                    msg.*.vertical_oscillation = (f / 10) - 0;
                },
                40 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint16);
                    msg.*.stance_time_percent = (f / 100) - 0;
                },
                41 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint16);
                    msg.*.stance_time = (f / 10) - 0;
                },
                42 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.activity_type = @enumFromInt(rf.raw_value.scalar.enumeration);
                },
                43 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint8);
                    msg.*.left_torque_effectiveness = (f / 2) - 0;
                },
                44 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint8);
                    msg.*.right_torque_effectiveness = (f / 2) - 0;
                },
                45 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint8);
                    msg.*.left_pedal_smoothness = (f / 2) - 0;
                },
                46 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint8);
                    msg.*.right_pedal_smoothness = (f / 2) - 0;
                },
                47 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint8);
                    msg.*.combined_pedal_smoothness = (f / 2) - 0;
                },
                48 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint8);
                    msg.*.time128 = (f / 128) - 0;
                },
                49 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.stroke_type = @enumFromInt(rf.raw_value.scalar.enumeration);
                },
                50 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.zone = rf.raw_value.scalar.uint8;
                },
                51 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint16);
                    msg.*.ball_speed = (f / 100) - 0;
                },
                52 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint16);
                    msg.*.cadence256 = (f / 256) - 0;
                },
                53 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint8);
                    msg.*.fractional_cadence = (f / 128) - 0;
                },
                54 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint16);
                    msg.*.total_hemoglobin_conc = (f / 100) - 0;
                },
                55 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint16);
                    msg.*.total_hemoglobin_conc_min = (f / 100) - 0;
                },
                56 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint16);
                    msg.*.total_hemoglobin_conc_max = (f / 100) - 0;
                },
                57 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint16);
                    msg.*.saturated_hemoglobin_percent = (f / 10) - 0;
                },
                58 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint16);
                    msg.*.saturated_hemoglobin_percent_min = (f / 10) - 0;
                },
                59 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint16);
                    msg.*.saturated_hemoglobin_percent_max = (f / 10) - 0;
                },
                62 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.device_index = @enumFromInt(rf.raw_value.scalar.uint8);
                },
                67 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .sint8);
                    msg.*.left_pco = rf.raw_value.scalar.sint8;
                },
                68 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .sint8);
                    msg.*.right_pco = rf.raw_value.scalar.sint8;
                },
                69 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.left_power_phase = try allocator.alloc(f32, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        const f: f32 = @floatFromInt(raw_value.uint8);
                        msg.*.left_power_phase.?[i] = (f / 0.7111111) - 0;
                    }
                },
                70 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.left_power_phase_peak = try allocator.alloc(f32, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        const f: f32 = @floatFromInt(raw_value.uint8);
                        msg.*.left_power_phase_peak.?[i] = (f / 0.7111111) - 0;
                    }
                },
                71 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.right_power_phase = try allocator.alloc(f32, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        const f: f32 = @floatFromInt(raw_value.uint8);
                        msg.*.right_power_phase.?[i] = (f / 0.7111111) - 0;
                    }
                },
                72 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.right_power_phase_peak = try allocator.alloc(f32, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        const f: f32 = @floatFromInt(raw_value.uint8);
                        msg.*.right_power_phase_peak.?[i] = (f / 0.7111111) - 0;
                    }
                },
                73 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint32);
                    msg.*.enhanced_speed = (f / 1000) - 0;
                },
                78 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint32);
                    msg.*.enhanced_altitude = (f / 5) - 500;
                },
                81 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint8);
                    msg.*.battery_soc = (f / 2) - 0;
                },
                82 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.motor_power = rf.raw_value.scalar.uint16;
                },
                83 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint16);
                    msg.*.vertical_ratio = (f / 100) - 0;
                },
                84 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint16);
                    msg.*.stance_time_balance = (f / 100) - 0;
                },
                85 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint16);
                    msg.*.step_length = (f / 10) - 0;
                },
                87 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint16);
                    msg.*.cycle_length16 = (f / 100) - 0;
                },
                91 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.absolute_pressure = rf.raw_value.scalar.uint32;
                },
                92 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint32);
                    msg.*.depth = (f / 1000) - 0;
                },
                93 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint32);
                    msg.*.next_stop_depth = (f / 1000) - 0;
                },
                94 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint32);
                    msg.*.next_stop_time = (f / 1) - 0;
                },
                95 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint32);
                    msg.*.time_to_surface = (f / 1) - 0;
                },
                96 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint32);
                    msg.*.ndl_time = (f / 1) - 0;
                },
                97 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.cns_load = rf.raw_value.scalar.uint8;
                },
                98 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint16);
                    msg.*.n2_load = (f / 1) - 0;
                },
                99 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint8);
                    msg.*.respiration_rate = (f / 1) - 0;
                },
                108 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint16);
                    msg.*.enhanced_respiration_rate = (f / 100) - 0;
                },
                114 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .float32);
                    msg.*.grit = rf.raw_value.scalar.float32;
                },
                115 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .float32);
                    msg.*.flow = rf.raw_value.scalar.float32;
                },
                116 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint16);
                    msg.*.current_stress = (f / 100) - 0;
                },
                117 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.ebike_travel_range = rf.raw_value.scalar.uint16;
                },
                118 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.ebike_battery_level = rf.raw_value.scalar.uint8;
                },
                119 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.ebike_assist_mode = rf.raw_value.scalar.uint8;
                },
                120 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.ebike_assist_level_percent = rf.raw_value.scalar.uint8;
                },
                123 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.air_time_remaining = rf.raw_value.scalar.uint32;
                },
                124 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint16);
                    msg.*.pressure_sac = (f / 100) - 0;
                },
                125 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint16);
                    msg.*.volume_sac = (f / 100) - 0;
                },
                126 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint16);
                    msg.*.rmv = (f / 100) - 0;
                },
                127 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .sint32);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.sint32);
                    msg.*.ascent_rate = (f / 1000) - 0;
                },
                129 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint8);
                    msg.*.po2 = (f / 100) - 0;
                },
                139 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint16);
                    msg.*.core_temperature = (f / 100) - 0;
                },
                else => {},
            }
        }
    }

    pub fn deinit(msg: RecordMessage, allocator: std.mem.Allocator) void {
        if (msg.compressed_speed_distance != null and msg.compressed_speed_distance.?.len > 0) {
            allocator.free(msg.compressed_speed_distance.?);
        }
        if (msg.speed_1s != null and msg.speed_1s.?.len > 0) {
            allocator.free(msg.speed_1s.?);
        }
        if (msg.left_power_phase != null and msg.left_power_phase.?.len > 0) {
            allocator.free(msg.left_power_phase.?);
        }
        if (msg.left_power_phase_peak != null and msg.left_power_phase_peak.?.len > 0) {
            allocator.free(msg.left_power_phase_peak.?);
        }
        if (msg.right_power_phase != null and msg.right_power_phase.?.len > 0) {
            allocator.free(msg.right_power_phase.?);
        }
        if (msg.right_power_phase_peak != null and msg.right_power_phase_peak.?.len > 0) {
            allocator.free(msg.right_power_phase_peak.?);
        }
    }
};

pub const EventMessage = struct {
    timestamp: ?u32 = null,
    event: ?Event = null,
    event_type: ?EventType = null,
    data16: ?u16 = null,
    event_group: ?u8 = null,
    /// Do not populate directly. Autogenerated by decoder for sport_point subfield components
    score: ?u16 = null,
    /// Do not populate directly. Autogenerated by decoder for sport_point subfield components
    opponent_score: ?u16 = null,
    /// Do not populate directly. Autogenerated by decoder for gear_change subfield components. Front gear number. 1 is innermost.
    front_gear_num: ?u8 = null,
    /// Do not populate directly. Autogenerated by decoder for gear_change subfield components. Number of front teeth.
    front_gear: ?u8 = null,
    /// Do not populate directly. Autogenerated by decoder for gear_change subfield components. Rear gear number. 1 is innermost.
    rear_gear_num: ?u8 = null,
    /// Do not populate directly. Autogenerated by decoder for gear_change subfield components. Number of rear teeth.
    rear_gear: ?u8 = null,
    device_index: ?DeviceIndex = null,
    /// Activity Type associated with an auto_activity_detect event
    activity_type: ?ActivityType = null,
    /// Do not populate directly. Autogenerated by decoder for threat_alert subfield components.
    radar_threat_level_max: ?RadarThreatLevelType = null,
    /// Do not populate directly. Autogenerated by decoder for threat_alert subfield components.
    radar_threat_count: ?u8 = null,
    /// Do not populate directly. Autogenerated by decoder for radar_threat_alert subfield components
    radar_threat_avg_approach_speed: ?f32 = null,
    /// Do not populate directly. Autogenerated by decoder for radar_threat_alert subfield components
    radar_threat_max_approach_speed: ?f32 = null,

    pub fn fromRawFields(msg: *EventMessage, raw_fields: []const decoder.FieldData) !void {
        msg.* = .{};
        for (raw_fields) |rf| {
            switch (rf.id) {
                253 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.timestamp = rf.raw_value.scalar.uint32;
                },
                0 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.event = @enumFromInt(rf.raw_value.scalar.enumeration);
                },
                1 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.event_type = @enumFromInt(rf.raw_value.scalar.enumeration);
                },
                2 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.data16 = rf.raw_value.scalar.uint16;
                },
                4 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.event_group = rf.raw_value.scalar.uint8;
                },
                7 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.score = rf.raw_value.scalar.uint16;
                },
                8 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.opponent_score = rf.raw_value.scalar.uint16;
                },
                9 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8z);
                    msg.*.front_gear_num = rf.raw_value.scalar.uint8z;
                },
                10 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8z);
                    msg.*.front_gear = rf.raw_value.scalar.uint8z;
                },
                11 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8z);
                    msg.*.rear_gear_num = rf.raw_value.scalar.uint8z;
                },
                12 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8z);
                    msg.*.rear_gear = rf.raw_value.scalar.uint8z;
                },
                13 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.device_index = @enumFromInt(rf.raw_value.scalar.uint8);
                },
                14 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.activity_type = @enumFromInt(rf.raw_value.scalar.enumeration);
                },
                21 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.radar_threat_level_max = @enumFromInt(rf.raw_value.scalar.enumeration);
                },
                22 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.radar_threat_count = rf.raw_value.scalar.uint8;
                },
                23 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint8);
                    msg.*.radar_threat_avg_approach_speed = (f / 10) - 0;
                },
                24 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint8);
                    msg.*.radar_threat_max_approach_speed = (f / 10) - 0;
                },
                else => {},
            }
        }
    }
};

pub const DeviceInfoMessage = struct {
    timestamp: ?u32 = null,
    device_index: ?DeviceIndex = null,
    manufacturer: ?Manufacturer = null,
    serial_number: ?u32 = null,
    software_version: ?f32 = null,
    hardware_version: ?u8 = null,
    /// Reset by new battery or charge.
    cum_operating_time: ?u32 = null,
    battery_voltage: ?f32 = null,
    battery_status: ?BatteryStatus = null,
    /// Indicates the location of the sensor
    sensor_position: ?BodyLocation = null,
    /// Used to describe the sensor or location
    descriptor: ?[:0]u8 = null,
    ant_transmission_type: ?u8 = null,
    ant_device_number: ?u16 = null,
    ant_network: ?AntNetwork = null,
    source_type: ?SourceType = null,
    /// Optional free form string to indicate the devices name or model
    product_name: ?[:0]u8 = null,
    battery_level: ?u8 = null,

    pub fn fromRawFields(msg: *DeviceInfoMessage, raw_fields: []const decoder.FieldData, allocator: std.mem.Allocator) !void {
        msg.* = .{};
        for (raw_fields) |rf| {
            switch (rf.id) {
                253 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.timestamp = rf.raw_value.scalar.uint32;
                },
                0 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.device_index = @enumFromInt(rf.raw_value.scalar.uint8);
                },
                2 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.manufacturer = @enumFromInt(rf.raw_value.scalar.uint16);
                },
                3 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32z);
                    msg.*.serial_number = rf.raw_value.scalar.uint32z;
                },
                5 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint16);
                    msg.*.software_version = (f / 100) - 0;
                },
                6 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.hardware_version = rf.raw_value.scalar.uint8;
                },
                7 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.cum_operating_time = rf.raw_value.scalar.uint32;
                },
                10 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint16);
                    msg.*.battery_voltage = (f / 256) - 0;
                },
                11 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.battery_status = @enumFromInt(rf.raw_value.scalar.uint8);
                },
                18 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.sensor_position = @enumFromInt(rf.raw_value.scalar.enumeration);
                },
                19 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .string);
                    msg.*.descriptor = try allocator.dupeSentinel(u8, rf.raw_value.scalar.string, 0);
                },
                20 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8z);
                    msg.*.ant_transmission_type = rf.raw_value.scalar.uint8z;
                },
                21 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16z);
                    msg.*.ant_device_number = rf.raw_value.scalar.uint16z;
                },
                22 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.ant_network = @enumFromInt(rf.raw_value.scalar.enumeration);
                },
                25 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.source_type = @enumFromInt(rf.raw_value.scalar.enumeration);
                },
                27 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .string);
                    msg.*.product_name = try allocator.dupeSentinel(u8, rf.raw_value.scalar.string, 0);
                },
                32 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.battery_level = rf.raw_value.scalar.uint8;
                },
                else => {},
            }
        }
    }

    pub fn deinit(msg: DeviceInfoMessage, allocator: std.mem.Allocator) void {
        if (msg.descriptor != null and msg.descriptor.?.len > 0) {
            allocator.free(msg.descriptor.?);
        }
        if (msg.product_name != null and msg.product_name.?.len > 0) {
            allocator.free(msg.product_name.?);
        }
    }
};

pub const DeviceAuxBatteryInfoMessage = struct {
    timestamp: ?u32 = null,
    device_index: ?DeviceIndex = null,
    battery_voltage: ?f32 = null,
    battery_status: ?BatteryStatus = null,
    battery_identifier: ?u8 = null,

    pub fn fromRawFields(msg: *DeviceAuxBatteryInfoMessage, raw_fields: []const decoder.FieldData) !void {
        msg.* = .{};
        for (raw_fields) |rf| {
            switch (rf.id) {
                253 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.timestamp = rf.raw_value.scalar.uint32;
                },
                0 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.device_index = @enumFromInt(rf.raw_value.scalar.uint8);
                },
                1 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint16);
                    msg.*.battery_voltage = (f / 256) - 0;
                },
                2 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.battery_status = @enumFromInt(rf.raw_value.scalar.uint8);
                },
                3 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.battery_identifier = rf.raw_value.scalar.uint8;
                },
                else => {},
            }
        }
    }
};

/// Corresponds to file_id of workout or course.
pub const TrainingFileMessage = struct {
    timestamp: ?u32 = null,
    type: ?File = null,
    manufacturer: ?Manufacturer = null,
    serial_number: ?u32 = null,
    time_created: ?u32 = null,

    pub fn fromRawFields(msg: *TrainingFileMessage, raw_fields: []const decoder.FieldData) !void {
        msg.* = .{};
        for (raw_fields) |rf| {
            switch (rf.id) {
                253 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.timestamp = rf.raw_value.scalar.uint32;
                },
                0 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.type = @enumFromInt(rf.raw_value.scalar.enumeration);
                },
                1 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.manufacturer = @enumFromInt(rf.raw_value.scalar.uint16);
                },
                3 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32z);
                    msg.*.serial_number = rf.raw_value.scalar.uint32z;
                },
                4 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.time_created = rf.raw_value.scalar.uint32;
                },
                else => {},
            }
        }
    }
};

pub const WeatherConditionsMessage = struct {
    /// time of update for current conditions, else forecast time
    timestamp: ?u32 = null,
    /// Current or forecast
    weather_report: ?WeatherReport = null,
    temperature: ?i8 = null,
    /// Corresponds to GSC Response weatherIcon field
    condition: ?WeatherStatus = null,
    wind_direction: ?u16 = null,
    wind_speed: ?f32 = null,
    /// range 0-100
    precipitation_probability: ?u8 = null,
    /// Heat Index if GCS heatIdx above or equal to 90F or wind chill if GCS windChill below or equal to 32F
    temperature_feels_like: ?i8 = null,
    relative_humidity: ?u8 = null,
    /// string corresponding to GCS response location string
    location: ?[:0]u8 = null,
    observed_at_time: ?u32 = null,
    observed_location_lat: ?i32 = null,
    observed_location_long: ?i32 = null,
    day_of_week: ?DayOfWeek = null,
    high_temperature: ?i8 = null,
    low_temperature: ?i8 = null,

    pub fn fromRawFields(msg: *WeatherConditionsMessage, raw_fields: []const decoder.FieldData, allocator: std.mem.Allocator) !void {
        msg.* = .{};
        for (raw_fields) |rf| {
            switch (rf.id) {
                253 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.timestamp = rf.raw_value.scalar.uint32;
                },
                0 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.weather_report = @enumFromInt(rf.raw_value.scalar.enumeration);
                },
                1 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .sint8);
                    msg.*.temperature = rf.raw_value.scalar.sint8;
                },
                2 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.condition = @enumFromInt(rf.raw_value.scalar.enumeration);
                },
                3 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.wind_direction = rf.raw_value.scalar.uint16;
                },
                4 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint16);
                    msg.*.wind_speed = (f / 1000) - 0;
                },
                5 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.precipitation_probability = rf.raw_value.scalar.uint8;
                },
                6 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .sint8);
                    msg.*.temperature_feels_like = rf.raw_value.scalar.sint8;
                },
                7 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.relative_humidity = rf.raw_value.scalar.uint8;
                },
                8 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .string);
                    msg.*.location = try allocator.dupeSentinel(u8, rf.raw_value.scalar.string, 0);
                },
                9 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.observed_at_time = rf.raw_value.scalar.uint32;
                },
                10 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .sint32);
                    msg.*.observed_location_lat = rf.raw_value.scalar.sint32;
                },
                11 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .sint32);
                    msg.*.observed_location_long = rf.raw_value.scalar.sint32;
                },
                12 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.day_of_week = @enumFromInt(rf.raw_value.scalar.enumeration);
                },
                13 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .sint8);
                    msg.*.high_temperature = rf.raw_value.scalar.sint8;
                },
                14 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .sint8);
                    msg.*.low_temperature = rf.raw_value.scalar.sint8;
                },
                else => {},
            }
        }
    }

    pub fn deinit(msg: WeatherConditionsMessage, allocator: std.mem.Allocator) void {
        if (msg.location != null and msg.location.?.len > 0) {
            allocator.free(msg.location.?);
        }
    }
};

pub const WeatherAlertMessage = struct {
    timestamp: ?u32 = null,
    /// Unique identifier from GCS report ID string, length is 12
    report_id: ?[:0]u8 = null,
    /// Time alert was issued
    issue_time: ?u32 = null,
    /// Time alert expires
    expire_time: ?u32 = null,
    /// Warning, Watch, Advisory, Statement
    severity: ?WeatherSeverity = null,
    /// Tornado, Severe Thunderstorm, etc.
    type: ?WeatherSevereType = null,

    pub fn fromRawFields(msg: *WeatherAlertMessage, raw_fields: []const decoder.FieldData, allocator: std.mem.Allocator) !void {
        msg.* = .{};
        for (raw_fields) |rf| {
            switch (rf.id) {
                253 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.timestamp = rf.raw_value.scalar.uint32;
                },
                0 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .string);
                    msg.*.report_id = try allocator.dupeSentinel(u8, rf.raw_value.scalar.string, 0);
                },
                1 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.issue_time = rf.raw_value.scalar.uint32;
                },
                2 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.expire_time = rf.raw_value.scalar.uint32;
                },
                3 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.severity = @enumFromInt(rf.raw_value.scalar.enumeration);
                },
                4 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.type = @enumFromInt(rf.raw_value.scalar.enumeration);
                },
                else => {},
            }
        }
    }

    pub fn deinit(msg: WeatherAlertMessage, allocator: std.mem.Allocator) void {
        if (msg.report_id != null and msg.report_id.?.len > 0) {
            allocator.free(msg.report_id.?);
        }
    }
};

pub const GpsMetadataMessage = struct {
    /// Whole second part of the timestamp.
    timestamp: ?u32 = null,
    /// Millisecond part of the timestamp.
    timestamp_ms: ?u16 = null,
    position_lat: ?i32 = null,
    position_long: ?i32 = null,
    enhanced_altitude: ?f32 = null,
    enhanced_speed: ?f32 = null,
    heading: ?f32 = null,
    /// Used to correlate UTC to system time if the timestamp of the message is in system time. This UTC time is derived from the GPS data.
    utc_timestamp: ?u32 = null,
    /// velocity[0] is lon velocity. Velocity[1] is lat velocity. Velocity[2] is altitude velocity.
    velocity: ?[]f32 = null,

    pub fn fromRawFields(msg: *GpsMetadataMessage, raw_fields: []const decoder.FieldData, allocator: std.mem.Allocator) !void {
        msg.* = .{};
        for (raw_fields) |rf| {
            switch (rf.id) {
                253 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.timestamp = rf.raw_value.scalar.uint32;
                },
                0 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.timestamp_ms = rf.raw_value.scalar.uint16;
                },
                1 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .sint32);
                    msg.*.position_lat = rf.raw_value.scalar.sint32;
                },
                2 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .sint32);
                    msg.*.position_long = rf.raw_value.scalar.sint32;
                },
                3 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint32);
                    msg.*.enhanced_altitude = (f / 5) - 500;
                },
                4 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint32);
                    msg.*.enhanced_speed = (f / 1000) - 0;
                },
                5 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint16);
                    msg.*.heading = (f / 100) - 0;
                },
                6 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.utc_timestamp = rf.raw_value.scalar.uint32;
                },
                7 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .sint16);
                    msg.*.velocity = try allocator.alloc(f32, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        const f: f32 = @floatFromInt(raw_value.sint16);
                        msg.*.velocity.?[i] = (f / 100) - 0;
                    }
                },
                else => {},
            }
        }
    }

    pub fn deinit(msg: GpsMetadataMessage, allocator: std.mem.Allocator) void {
        if (msg.velocity != null and msg.velocity.?.len > 0) {
            allocator.free(msg.velocity.?);
        }
    }
};

pub const CameraEventMessage = struct {
    /// Whole second part of the timestamp.
    timestamp: ?u32 = null,
    /// Millisecond part of the timestamp.
    timestamp_ms: ?u16 = null,
    camera_event_type: ?CameraEventType = null,
    camera_file_uuid: ?[:0]u8 = null,
    camera_orientation: ?CameraOrientationType = null,

    pub fn fromRawFields(msg: *CameraEventMessage, raw_fields: []const decoder.FieldData, allocator: std.mem.Allocator) !void {
        msg.* = .{};
        for (raw_fields) |rf| {
            switch (rf.id) {
                253 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.timestamp = rf.raw_value.scalar.uint32;
                },
                0 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.timestamp_ms = rf.raw_value.scalar.uint16;
                },
                1 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.camera_event_type = @enumFromInt(rf.raw_value.scalar.enumeration);
                },
                2 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .string);
                    msg.*.camera_file_uuid = try allocator.dupeSentinel(u8, rf.raw_value.scalar.string, 0);
                },
                3 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.camera_orientation = @enumFromInt(rf.raw_value.scalar.enumeration);
                },
                else => {},
            }
        }
    }

    pub fn deinit(msg: CameraEventMessage, allocator: std.mem.Allocator) void {
        if (msg.camera_file_uuid != null and msg.camera_file_uuid.?.len > 0) {
            allocator.free(msg.camera_file_uuid.?);
        }
    }
};

pub const GyroscopeDataMessage = struct {
    /// Whole second part of the timestamp
    timestamp: ?u32 = null,
    /// Millisecond part of the timestamp.
    timestamp_ms: ?u16 = null,
    /// Each time in the array describes the time at which the gyro sample with the corrosponding index was taken. Limited to 30 samples in each message. The samples may span across seconds. Array size must match the number of samples in gyro_x and gyro_y and gyro_z
    sample_time_offset: ?[]u16 = null,
    /// These are the raw ADC reading. Maximum number of samples is 30 in each message. The samples may span across seconds. A conversion will need to be done on this data once read.
    gyro_x: ?[]u16 = null,
    /// These are the raw ADC reading. Maximum number of samples is 30 in each message. The samples may span across seconds. A conversion will need to be done on this data once read.
    gyro_y: ?[]u16 = null,
    /// These are the raw ADC reading. Maximum number of samples is 30 in each message. The samples may span across seconds. A conversion will need to be done on this data once read.
    gyro_z: ?[]u16 = null,
    /// Calibrated gyro reading
    calibrated_gyro_x: ?[]f32 = null,
    /// Calibrated gyro reading
    calibrated_gyro_y: ?[]f32 = null,
    /// Calibrated gyro reading
    calibrated_gyro_z: ?[]f32 = null,

    pub fn fromRawFields(msg: *GyroscopeDataMessage, raw_fields: []const decoder.FieldData, allocator: std.mem.Allocator) !void {
        msg.* = .{};
        for (raw_fields) |rf| {
            switch (rf.id) {
                253 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.timestamp = rf.raw_value.scalar.uint32;
                },
                0 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.timestamp_ms = rf.raw_value.scalar.uint16;
                },
                1 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.sample_time_offset = try allocator.alloc(u16, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        msg.*.sample_time_offset[i] = raw_value.uint16;
                    }
                },
                2 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.gyro_x = try allocator.alloc(u16, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        msg.*.gyro_x[i] = raw_value.uint16;
                    }
                },
                3 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.gyro_y = try allocator.alloc(u16, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        msg.*.gyro_y[i] = raw_value.uint16;
                    }
                },
                4 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.gyro_z = try allocator.alloc(u16, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        msg.*.gyro_z[i] = raw_value.uint16;
                    }
                },
                5 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .float32);
                    msg.*.calibrated_gyro_x = try allocator.alloc(f32, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        msg.*.calibrated_gyro_x[i] = raw_value.float32;
                    }
                },
                6 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .float32);
                    msg.*.calibrated_gyro_y = try allocator.alloc(f32, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        msg.*.calibrated_gyro_y[i] = raw_value.float32;
                    }
                },
                7 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .float32);
                    msg.*.calibrated_gyro_z = try allocator.alloc(f32, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        msg.*.calibrated_gyro_z[i] = raw_value.float32;
                    }
                },
                else => {},
            }
        }
    }

    pub fn deinit(msg: GyroscopeDataMessage, allocator: std.mem.Allocator) void {
        if (msg.sample_time_offset != null and msg.sample_time_offset.?.len > 0) {
            allocator.free(msg.sample_time_offset.?);
        }
        if (msg.gyro_x != null and msg.gyro_x.?.len > 0) {
            allocator.free(msg.gyro_x.?);
        }
        if (msg.gyro_y != null and msg.gyro_y.?.len > 0) {
            allocator.free(msg.gyro_y.?);
        }
        if (msg.gyro_z != null and msg.gyro_z.?.len > 0) {
            allocator.free(msg.gyro_z.?);
        }
        if (msg.calibrated_gyro_x != null and msg.calibrated_gyro_x.?.len > 0) {
            allocator.free(msg.calibrated_gyro_x.?);
        }
        if (msg.calibrated_gyro_y != null and msg.calibrated_gyro_y.?.len > 0) {
            allocator.free(msg.calibrated_gyro_y.?);
        }
        if (msg.calibrated_gyro_z != null and msg.calibrated_gyro_z.?.len > 0) {
            allocator.free(msg.calibrated_gyro_z.?);
        }
    }
};

pub const AccelerometerDataMessage = struct {
    /// Whole second part of the timestamp
    timestamp: ?u32 = null,
    /// Millisecond part of the timestamp.
    timestamp_ms: ?u16 = null,
    /// Each time in the array describes the time at which the accelerometer sample with the corrosponding index was taken. Limited to 30 samples in each message. The samples may span across seconds. Array size must match the number of samples in accel_x and accel_y and accel_z
    sample_time_offset: ?[]u16 = null,
    /// These are the raw ADC reading. Maximum number of samples is 30 in each message. The samples may span across seconds. A conversion will need to be done on this data once read.
    accel_x: ?[]u16 = null,
    /// These are the raw ADC reading. Maximum number of samples is 30 in each message. The samples may span across seconds. A conversion will need to be done on this data once read.
    accel_y: ?[]u16 = null,
    /// These are the raw ADC reading. Maximum number of samples is 30 in each message. The samples may span across seconds. A conversion will need to be done on this data once read.
    accel_z: ?[]u16 = null,
    /// Calibrated accel reading
    calibrated_accel_x: ?[]f32 = null,
    /// Calibrated accel reading
    calibrated_accel_y: ?[]f32 = null,
    /// Calibrated accel reading
    calibrated_accel_z: ?[]f32 = null,
    /// Calibrated accel reading
    compressed_calibrated_accel_x: ?[]i16 = null,
    /// Calibrated accel reading
    compressed_calibrated_accel_y: ?[]i16 = null,
    /// Calibrated accel reading
    compressed_calibrated_accel_z: ?[]i16 = null,

    pub fn fromRawFields(msg: *AccelerometerDataMessage, raw_fields: []const decoder.FieldData, allocator: std.mem.Allocator) !void {
        msg.* = .{};
        for (raw_fields) |rf| {
            switch (rf.id) {
                253 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.timestamp = rf.raw_value.scalar.uint32;
                },
                0 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.timestamp_ms = rf.raw_value.scalar.uint16;
                },
                1 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.sample_time_offset = try allocator.alloc(u16, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        msg.*.sample_time_offset[i] = raw_value.uint16;
                    }
                },
                2 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.accel_x = try allocator.alloc(u16, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        msg.*.accel_x[i] = raw_value.uint16;
                    }
                },
                3 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.accel_y = try allocator.alloc(u16, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        msg.*.accel_y[i] = raw_value.uint16;
                    }
                },
                4 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.accel_z = try allocator.alloc(u16, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        msg.*.accel_z[i] = raw_value.uint16;
                    }
                },
                5 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .float32);
                    msg.*.calibrated_accel_x = try allocator.alloc(f32, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        msg.*.calibrated_accel_x[i] = raw_value.float32;
                    }
                },
                6 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .float32);
                    msg.*.calibrated_accel_y = try allocator.alloc(f32, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        msg.*.calibrated_accel_y[i] = raw_value.float32;
                    }
                },
                7 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .float32);
                    msg.*.calibrated_accel_z = try allocator.alloc(f32, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        msg.*.calibrated_accel_z[i] = raw_value.float32;
                    }
                },
                8 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .sint16);
                    msg.*.compressed_calibrated_accel_x = try allocator.alloc(i16, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        msg.*.compressed_calibrated_accel_x[i] = raw_value.sint16;
                    }
                },
                9 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .sint16);
                    msg.*.compressed_calibrated_accel_y = try allocator.alloc(i16, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        msg.*.compressed_calibrated_accel_y[i] = raw_value.sint16;
                    }
                },
                10 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .sint16);
                    msg.*.compressed_calibrated_accel_z = try allocator.alloc(i16, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        msg.*.compressed_calibrated_accel_z[i] = raw_value.sint16;
                    }
                },
                else => {},
            }
        }
    }

    pub fn deinit(msg: AccelerometerDataMessage, allocator: std.mem.Allocator) void {
        if (msg.sample_time_offset != null and msg.sample_time_offset.?.len > 0) {
            allocator.free(msg.sample_time_offset.?);
        }
        if (msg.accel_x != null and msg.accel_x.?.len > 0) {
            allocator.free(msg.accel_x.?);
        }
        if (msg.accel_y != null and msg.accel_y.?.len > 0) {
            allocator.free(msg.accel_y.?);
        }
        if (msg.accel_z != null and msg.accel_z.?.len > 0) {
            allocator.free(msg.accel_z.?);
        }
        if (msg.calibrated_accel_x != null and msg.calibrated_accel_x.?.len > 0) {
            allocator.free(msg.calibrated_accel_x.?);
        }
        if (msg.calibrated_accel_y != null and msg.calibrated_accel_y.?.len > 0) {
            allocator.free(msg.calibrated_accel_y.?);
        }
        if (msg.calibrated_accel_z != null and msg.calibrated_accel_z.?.len > 0) {
            allocator.free(msg.calibrated_accel_z.?);
        }
        if (msg.compressed_calibrated_accel_x != null and msg.compressed_calibrated_accel_x.?.len > 0) {
            allocator.free(msg.compressed_calibrated_accel_x.?);
        }
        if (msg.compressed_calibrated_accel_y != null and msg.compressed_calibrated_accel_y.?.len > 0) {
            allocator.free(msg.compressed_calibrated_accel_y.?);
        }
        if (msg.compressed_calibrated_accel_z != null and msg.compressed_calibrated_accel_z.?.len > 0) {
            allocator.free(msg.compressed_calibrated_accel_z.?);
        }
    }
};

pub const MagnetometerDataMessage = struct {
    /// Whole second part of the timestamp
    timestamp: ?u32 = null,
    /// Millisecond part of the timestamp.
    timestamp_ms: ?u16 = null,
    /// Each time in the array describes the time at which the compass sample with the corrosponding index was taken. Limited to 30 samples in each message. The samples may span across seconds. Array size must match the number of samples in cmps_x and cmps_y and cmps_z
    sample_time_offset: ?[]u16 = null,
    /// These are the raw ADC reading. Maximum number of samples is 30 in each message. The samples may span across seconds. A conversion will need to be done on this data once read.
    mag_x: ?[]u16 = null,
    /// These are the raw ADC reading. Maximum number of samples is 30 in each message. The samples may span across seconds. A conversion will need to be done on this data once read.
    mag_y: ?[]u16 = null,
    /// These are the raw ADC reading. Maximum number of samples is 30 in each message. The samples may span across seconds. A conversion will need to be done on this data once read.
    mag_z: ?[]u16 = null,
    /// Calibrated Magnetometer reading
    calibrated_mag_x: ?[]f32 = null,
    /// Calibrated Magnetometer reading
    calibrated_mag_y: ?[]f32 = null,
    /// Calibrated Magnetometer reading
    calibrated_mag_z: ?[]f32 = null,

    pub fn fromRawFields(msg: *MagnetometerDataMessage, raw_fields: []const decoder.FieldData, allocator: std.mem.Allocator) !void {
        msg.* = .{};
        for (raw_fields) |rf| {
            switch (rf.id) {
                253 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.timestamp = rf.raw_value.scalar.uint32;
                },
                0 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.timestamp_ms = rf.raw_value.scalar.uint16;
                },
                1 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.sample_time_offset = try allocator.alloc(u16, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        msg.*.sample_time_offset[i] = raw_value.uint16;
                    }
                },
                2 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.mag_x = try allocator.alloc(u16, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        msg.*.mag_x[i] = raw_value.uint16;
                    }
                },
                3 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.mag_y = try allocator.alloc(u16, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        msg.*.mag_y[i] = raw_value.uint16;
                    }
                },
                4 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.mag_z = try allocator.alloc(u16, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        msg.*.mag_z[i] = raw_value.uint16;
                    }
                },
                5 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .float32);
                    msg.*.calibrated_mag_x = try allocator.alloc(f32, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        msg.*.calibrated_mag_x[i] = raw_value.float32;
                    }
                },
                6 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .float32);
                    msg.*.calibrated_mag_y = try allocator.alloc(f32, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        msg.*.calibrated_mag_y[i] = raw_value.float32;
                    }
                },
                7 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .float32);
                    msg.*.calibrated_mag_z = try allocator.alloc(f32, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        msg.*.calibrated_mag_z[i] = raw_value.float32;
                    }
                },
                else => {},
            }
        }
    }

    pub fn deinit(msg: MagnetometerDataMessage, allocator: std.mem.Allocator) void {
        if (msg.sample_time_offset != null and msg.sample_time_offset.?.len > 0) {
            allocator.free(msg.sample_time_offset.?);
        }
        if (msg.mag_x != null and msg.mag_x.?.len > 0) {
            allocator.free(msg.mag_x.?);
        }
        if (msg.mag_y != null and msg.mag_y.?.len > 0) {
            allocator.free(msg.mag_y.?);
        }
        if (msg.mag_z != null and msg.mag_z.?.len > 0) {
            allocator.free(msg.mag_z.?);
        }
        if (msg.calibrated_mag_x != null and msg.calibrated_mag_x.?.len > 0) {
            allocator.free(msg.calibrated_mag_x.?);
        }
        if (msg.calibrated_mag_y != null and msg.calibrated_mag_y.?.len > 0) {
            allocator.free(msg.calibrated_mag_y.?);
        }
        if (msg.calibrated_mag_z != null and msg.calibrated_mag_z.?.len > 0) {
            allocator.free(msg.calibrated_mag_z.?);
        }
    }
};

pub const BarometerDataMessage = struct {
    /// Whole second part of the timestamp
    timestamp: ?u32 = null,
    /// Millisecond part of the timestamp.
    timestamp_ms: ?u16 = null,
    /// Each time in the array describes the time at which the barometer sample with the corrosponding index was taken. The samples may span across seconds. Array size must match the number of samples in baro_cal
    sample_time_offset: ?[]u16 = null,
    /// These are the raw ADC reading. The samples may span across seconds. A conversion will need to be done on this data once read.
    baro_pres: ?[]u32 = null,

    pub fn fromRawFields(msg: *BarometerDataMessage, raw_fields: []const decoder.FieldData, allocator: std.mem.Allocator) !void {
        msg.* = .{};
        for (raw_fields) |rf| {
            switch (rf.id) {
                253 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.timestamp = rf.raw_value.scalar.uint32;
                },
                0 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.timestamp_ms = rf.raw_value.scalar.uint16;
                },
                1 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.sample_time_offset = try allocator.alloc(u16, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        msg.*.sample_time_offset[i] = raw_value.uint16;
                    }
                },
                2 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.baro_pres = try allocator.alloc(u32, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        msg.*.baro_pres[i] = raw_value.uint32;
                    }
                },
                else => {},
            }
        }
    }

    pub fn deinit(msg: BarometerDataMessage, allocator: std.mem.Allocator) void {
        if (msg.sample_time_offset != null and msg.sample_time_offset.?.len > 0) {
            allocator.free(msg.sample_time_offset.?);
        }
        if (msg.baro_pres != null and msg.baro_pres.?.len > 0) {
            allocator.free(msg.baro_pres.?);
        }
    }
};

pub const ThreeDSensorCalibrationMessage = struct {
    /// Whole second part of the timestamp
    timestamp: ?u32 = null,
    /// Indicates which sensor the calibration is for
    sensor_type: ?SensorType = null,
    /// Calibration factor divisor
    calibration_divisor: ?u32 = null,
    /// Level shift value used to shift the ADC value back into range
    level_shift: ?u32 = null,
    /// Internal calibration factors, one for each: xy, yx, zx
    offset_cal: ?[]i32 = null,
    /// 3 x 3 rotation matrix (row major)
    orientation_matrix: ?[]f32 = null,

    pub fn fromRawFields(msg: *ThreeDSensorCalibrationMessage, raw_fields: []const decoder.FieldData, allocator: std.mem.Allocator) !void {
        msg.* = .{};
        for (raw_fields) |rf| {
            switch (rf.id) {
                253 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.timestamp = rf.raw_value.scalar.uint32;
                },
                0 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.sensor_type = @enumFromInt(rf.raw_value.scalar.enumeration);
                },
                2 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.calibration_divisor = rf.raw_value.scalar.uint32;
                },
                3 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.level_shift = rf.raw_value.scalar.uint32;
                },
                4 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .sint32);
                    msg.*.offset_cal = try allocator.alloc(i32, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        msg.*.offset_cal[i] = raw_value.sint32;
                    }
                },
                5 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .sint32);
                    msg.*.orientation_matrix = try allocator.alloc(f32, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        const f: f32 = @floatFromInt(raw_value.sint32);
                        msg.*.orientation_matrix.?[i] = (f / 65535) - 0;
                    }
                },
                else => {},
            }
        }
    }

    pub fn deinit(msg: ThreeDSensorCalibrationMessage, allocator: std.mem.Allocator) void {
        if (msg.offset_cal != null and msg.offset_cal.?.len > 0) {
            allocator.free(msg.offset_cal.?);
        }
        if (msg.orientation_matrix != null and msg.orientation_matrix.?.len > 0) {
            allocator.free(msg.orientation_matrix.?);
        }
    }
};

pub const OneDSensorCalibrationMessage = struct {
    /// Whole second part of the timestamp
    timestamp: ?u32 = null,
    /// Indicates which sensor the calibration is for
    sensor_type: ?SensorType = null,
    /// Calibration factor divisor
    calibration_divisor: ?u32 = null,
    /// Level shift value used to shift the ADC value back into range
    level_shift: ?u32 = null,
    /// Internal Calibration factor
    offset_cal: ?i32 = null,

    pub fn fromRawFields(msg: *OneDSensorCalibrationMessage, raw_fields: []const decoder.FieldData) !void {
        msg.* = .{};
        for (raw_fields) |rf| {
            switch (rf.id) {
                253 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.timestamp = rf.raw_value.scalar.uint32;
                },
                0 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.sensor_type = @enumFromInt(rf.raw_value.scalar.enumeration);
                },
                2 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.calibration_divisor = rf.raw_value.scalar.uint32;
                },
                3 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.level_shift = rf.raw_value.scalar.uint32;
                },
                4 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .sint32);
                    msg.*.offset_cal = rf.raw_value.scalar.sint32;
                },
                else => {},
            }
        }
    }
};

pub const VideoFrameMessage = struct {
    /// Whole second part of the timestamp
    timestamp: ?u32 = null,
    /// Millisecond part of the timestamp.
    timestamp_ms: ?u16 = null,
    /// Number of the frame that the timestamp and timestamp_ms correlate to
    frame_number: ?u32 = null,

    pub fn fromRawFields(msg: *VideoFrameMessage, raw_fields: []const decoder.FieldData) !void {
        msg.* = .{};
        for (raw_fields) |rf| {
            switch (rf.id) {
                253 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.timestamp = rf.raw_value.scalar.uint32;
                },
                0 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.timestamp_ms = rf.raw_value.scalar.uint16;
                },
                1 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.frame_number = rf.raw_value.scalar.uint32;
                },
                else => {},
            }
        }
    }
};

pub const ObdiiDataMessage = struct {
    /// Timestamp message was output
    timestamp: ?u32 = null,
    /// Fractional part of timestamp, added to timestamp
    timestamp_ms: ?u16 = null,
    /// Offset of PID reading [i] from start_timestamp+start_timestamp_ms. Readings may span accross seconds.
    time_offset: ?[]u16 = null,
    /// Parameter ID
    pid: ?u8 = null,
    /// Raw parameter data
    raw_data: ?[]u8 = null,
    /// Optional, data size of PID[i]. If not specified refer to SAE J1979.
    pid_data_size: ?[]u8 = null,
    /// System time associated with sample expressed in ms, can be used instead of time_offset. There will be a system_time value for each raw_data element. For multibyte pids the system_time is repeated.
    system_time: ?[]u32 = null,
    /// Timestamp of first sample recorded in the message. Used with time_offset to generate time of each sample
    start_timestamp: ?u32 = null,
    /// Fractional part of start_timestamp
    start_timestamp_ms: ?u16 = null,

    pub fn fromRawFields(msg: *ObdiiDataMessage, raw_fields: []const decoder.FieldData, allocator: std.mem.Allocator) !void {
        msg.* = .{};
        for (raw_fields) |rf| {
            switch (rf.id) {
                253 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.timestamp = rf.raw_value.scalar.uint32;
                },
                0 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.timestamp_ms = rf.raw_value.scalar.uint16;
                },
                1 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.time_offset = try allocator.alloc(u16, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        msg.*.time_offset[i] = raw_value.uint16;
                    }
                },
                2 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .byte);
                    msg.*.pid = rf.raw_value.scalar.byte;
                },
                3 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .byte);
                    msg.*.raw_data = try allocator.alloc(u8, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        msg.*.raw_data[i] = raw_value.byte;
                    }
                },
                4 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.pid_data_size = try allocator.alloc(u8, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        msg.*.pid_data_size[i] = raw_value.uint8;
                    }
                },
                5 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.system_time = try allocator.alloc(u32, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        msg.*.system_time[i] = raw_value.uint32;
                    }
                },
                6 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.start_timestamp = rf.raw_value.scalar.uint32;
                },
                7 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.start_timestamp_ms = rf.raw_value.scalar.uint16;
                },
                else => {},
            }
        }
    }

    pub fn deinit(msg: ObdiiDataMessage, allocator: std.mem.Allocator) void {
        if (msg.time_offset != null and msg.time_offset.?.len > 0) {
            allocator.free(msg.time_offset.?);
        }
        if (msg.raw_data != null and msg.raw_data.?.len > 0) {
            allocator.free(msg.raw_data.?);
        }
        if (msg.pid_data_size != null and msg.pid_data_size.?.len > 0) {
            allocator.free(msg.pid_data_size.?);
        }
        if (msg.system_time != null and msg.system_time.?.len > 0) {
            allocator.free(msg.system_time.?);
        }
    }
};

pub const NmeaSentenceMessage = struct {
    /// Timestamp message was output
    timestamp: ?u32 = null,
    /// Fractional part of timestamp, added to timestamp
    timestamp_ms: ?u16 = null,
    /// NMEA sentence
    sentence: ?[:0]u8 = null,

    pub fn fromRawFields(msg: *NmeaSentenceMessage, raw_fields: []const decoder.FieldData, allocator: std.mem.Allocator) !void {
        msg.* = .{};
        for (raw_fields) |rf| {
            switch (rf.id) {
                253 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.timestamp = rf.raw_value.scalar.uint32;
                },
                0 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.timestamp_ms = rf.raw_value.scalar.uint16;
                },
                1 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .string);
                    msg.*.sentence = try allocator.dupeSentinel(u8, rf.raw_value.scalar.string, 0);
                },
                else => {},
            }
        }
    }

    pub fn deinit(msg: NmeaSentenceMessage, allocator: std.mem.Allocator) void {
        if (msg.sentence != null and msg.sentence.?.len > 0) {
            allocator.free(msg.sentence.?);
        }
    }
};

pub const AviationAttitudeMessage = struct {
    /// Timestamp message was output
    timestamp: ?u32 = null,
    /// Fractional part of timestamp, added to timestamp
    timestamp_ms: ?u16 = null,
    /// System time associated with sample expressed in ms.
    system_time: ?[]u32 = null,
    /// Range -PI/2 to +PI/2
    pitch: ?[]f32 = null,
    /// Range -PI to +PI
    roll: ?[]f32 = null,
    /// Range -78.4 to +78.4 (-8 Gs to 8 Gs)
    accel_lateral: ?[]f32 = null,
    /// Range -78.4 to +78.4 (-8 Gs to 8 Gs)
    accel_normal: ?[]f32 = null,
    /// Range -8.727 to +8.727 (-500 degs/sec to +500 degs/sec)
    turn_rate: ?[]f32 = null,
    stage: ?[]AttitudeStage = null,
    /// The percent complete of the current attitude stage. Set to 0 for attitude stages 0, 1 and 2 and to 100 for attitude stage 3 by AHRS modules that do not support it. Range - 100
    attitude_stage_complete: ?[]u8 = null,
    /// Track Angle/Heading Range 0 - 2pi
    track: ?[]f32 = null,
    validity: ?[]AttitudeValidity = null,

    pub fn fromRawFields(msg: *AviationAttitudeMessage, raw_fields: []const decoder.FieldData, allocator: std.mem.Allocator) !void {
        msg.* = .{};
        for (raw_fields) |rf| {
            switch (rf.id) {
                253 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.timestamp = rf.raw_value.scalar.uint32;
                },
                0 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.timestamp_ms = rf.raw_value.scalar.uint16;
                },
                1 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.system_time = try allocator.alloc(u32, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        msg.*.system_time[i] = raw_value.uint32;
                    }
                },
                2 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .sint16);
                    msg.*.pitch = try allocator.alloc(f32, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        const f: f32 = @floatFromInt(raw_value.sint16);
                        msg.*.pitch.?[i] = (f / 10430.38) - 0;
                    }
                },
                3 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .sint16);
                    msg.*.roll = try allocator.alloc(f32, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        const f: f32 = @floatFromInt(raw_value.sint16);
                        msg.*.roll.?[i] = (f / 10430.38) - 0;
                    }
                },
                4 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .sint16);
                    msg.*.accel_lateral = try allocator.alloc(f32, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        const f: f32 = @floatFromInt(raw_value.sint16);
                        msg.*.accel_lateral.?[i] = (f / 100) - 0;
                    }
                },
                5 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .sint16);
                    msg.*.accel_normal = try allocator.alloc(f32, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        const f: f32 = @floatFromInt(raw_value.sint16);
                        msg.*.accel_normal.?[i] = (f / 100) - 0;
                    }
                },
                6 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .sint16);
                    msg.*.turn_rate = try allocator.alloc(f32, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        const f: f32 = @floatFromInt(raw_value.sint16);
                        msg.*.turn_rate.?[i] = (f / 1024) - 0;
                    }
                },
                7 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.stage = try allocator.alloc(AttitudeStage, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        msg.*.stage[i] = raw_value.enumeration;
                    }
                },
                8 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.attitude_stage_complete = try allocator.alloc(u8, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        msg.*.attitude_stage_complete[i] = raw_value.uint8;
                    }
                },
                9 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.track = try allocator.alloc(f32, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        const f: f32 = @floatFromInt(raw_value.uint16);
                        msg.*.track.?[i] = (f / 10430.38) - 0;
                    }
                },
                10 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.validity = try allocator.alloc(AttitudeValidity, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        msg.*.validity[i] = raw_value.uint16;
                    }
                },
                else => {},
            }
        }
    }

    pub fn deinit(msg: AviationAttitudeMessage, allocator: std.mem.Allocator) void {
        if (msg.system_time != null and msg.system_time.?.len > 0) {
            allocator.free(msg.system_time.?);
        }
        if (msg.pitch != null and msg.pitch.?.len > 0) {
            allocator.free(msg.pitch.?);
        }
        if (msg.roll != null and msg.roll.?.len > 0) {
            allocator.free(msg.roll.?);
        }
        if (msg.accel_lateral != null and msg.accel_lateral.?.len > 0) {
            allocator.free(msg.accel_lateral.?);
        }
        if (msg.accel_normal != null and msg.accel_normal.?.len > 0) {
            allocator.free(msg.accel_normal.?);
        }
        if (msg.turn_rate != null and msg.turn_rate.?.len > 0) {
            allocator.free(msg.turn_rate.?);
        }
        if (msg.stage != null and msg.stage.?.len > 0) {
            allocator.free(msg.stage.?);
        }
        if (msg.attitude_stage_complete != null and msg.attitude_stage_complete.?.len > 0) {
            allocator.free(msg.attitude_stage_complete.?);
        }
        if (msg.track != null and msg.track.?.len > 0) {
            allocator.free(msg.track.?);
        }
        if (msg.validity != null and msg.validity.?.len > 0) {
            allocator.free(msg.validity.?);
        }
    }
};

pub const VideoMessage = struct {
    url: ?[:0]u8 = null,
    hosting_provider: ?[:0]u8 = null,
    /// Playback time of video
    duration: ?u32 = null,

    pub fn fromRawFields(msg: *VideoMessage, raw_fields: []const decoder.FieldData, allocator: std.mem.Allocator) !void {
        msg.* = .{};
        for (raw_fields) |rf| {
            switch (rf.id) {
                0 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .string);
                    msg.*.url = try allocator.dupeSentinel(u8, rf.raw_value.scalar.string, 0);
                },
                1 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .string);
                    msg.*.hosting_provider = try allocator.dupeSentinel(u8, rf.raw_value.scalar.string, 0);
                },
                2 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.duration = rf.raw_value.scalar.uint32;
                },
                else => {},
            }
        }
    }

    pub fn deinit(msg: VideoMessage, allocator: std.mem.Allocator) void {
        if (msg.url != null and msg.url.?.len > 0) {
            allocator.free(msg.url.?);
        }
        if (msg.hosting_provider != null and msg.hosting_provider.?.len > 0) {
            allocator.free(msg.hosting_provider.?);
        }
    }
};

pub const VideoTitleMessage = struct {
    /// Long titles will be split into multiple parts
    message_index: ?MessageIndex = null,
    /// Total number of title parts
    message_count: ?u16 = null,
    text: ?[:0]u8 = null,

    pub fn fromRawFields(msg: *VideoTitleMessage, raw_fields: []const decoder.FieldData, allocator: std.mem.Allocator) !void {
        msg.* = .{};
        for (raw_fields) |rf| {
            switch (rf.id) {
                254 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.message_index = @enumFromInt(rf.raw_value.scalar.uint16);
                },
                0 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.message_count = rf.raw_value.scalar.uint16;
                },
                1 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .string);
                    msg.*.text = try allocator.dupeSentinel(u8, rf.raw_value.scalar.string, 0);
                },
                else => {},
            }
        }
    }

    pub fn deinit(msg: VideoTitleMessage, allocator: std.mem.Allocator) void {
        if (msg.text != null and msg.text.?.len > 0) {
            allocator.free(msg.text.?);
        }
    }
};

pub const VideoDescriptionMessage = struct {
    /// Long descriptions will be split into multiple parts
    message_index: ?MessageIndex = null,
    /// Total number of description parts
    message_count: ?u16 = null,
    text: ?[:0]u8 = null,

    pub fn fromRawFields(msg: *VideoDescriptionMessage, raw_fields: []const decoder.FieldData, allocator: std.mem.Allocator) !void {
        msg.* = .{};
        for (raw_fields) |rf| {
            switch (rf.id) {
                254 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.message_index = @enumFromInt(rf.raw_value.scalar.uint16);
                },
                0 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.message_count = rf.raw_value.scalar.uint16;
                },
                1 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .string);
                    msg.*.text = try allocator.dupeSentinel(u8, rf.raw_value.scalar.string, 0);
                },
                else => {},
            }
        }
    }

    pub fn deinit(msg: VideoDescriptionMessage, allocator: std.mem.Allocator) void {
        if (msg.text != null and msg.text.?.len > 0) {
            allocator.free(msg.text.?);
        }
    }
};

pub const VideoClipMessage = struct {
    clip_number: ?u16 = null,
    start_timestamp: ?u32 = null,
    start_timestamp_ms: ?u16 = null,
    end_timestamp: ?u32 = null,
    end_timestamp_ms: ?u16 = null,
    /// Start of clip in video time
    clip_start: ?u32 = null,
    /// End of clip in video time
    clip_end: ?u32 = null,

    pub fn fromRawFields(msg: *VideoClipMessage, raw_fields: []const decoder.FieldData) !void {
        msg.* = .{};
        for (raw_fields) |rf| {
            switch (rf.id) {
                0 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.clip_number = rf.raw_value.scalar.uint16;
                },
                1 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.start_timestamp = rf.raw_value.scalar.uint32;
                },
                2 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.start_timestamp_ms = rf.raw_value.scalar.uint16;
                },
                3 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.end_timestamp = rf.raw_value.scalar.uint32;
                },
                4 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.end_timestamp_ms = rf.raw_value.scalar.uint16;
                },
                6 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.clip_start = rf.raw_value.scalar.uint32;
                },
                7 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.clip_end = rf.raw_value.scalar.uint32;
                },
                else => {},
            }
        }
    }
};

pub const SetMessage = struct {
    /// Timestamp of the set
    timestamp: ?u32 = null,
    duration: ?f32 = null,
    /// # of repitions of the movement
    repetitions: ?u16 = null,
    /// Amount of weight applied for the set
    weight: ?f32 = null,
    set_type: ?SetType = null,
    /// Start time of the set
    start_time: ?u32 = null,
    category: ?[]ExerciseCategory = null,
    /// Based on the associated category, see [category]_exercise_names
    category_subtype: ?[]u16 = null,
    weight_display_unit: ?FitBaseUnit = null,
    message_index: ?MessageIndex = null,
    wkt_step_index: ?MessageIndex = null,

    pub fn fromRawFields(msg: *SetMessage, raw_fields: []const decoder.FieldData, allocator: std.mem.Allocator) !void {
        msg.* = .{};
        for (raw_fields) |rf| {
            switch (rf.id) {
                254 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.timestamp = rf.raw_value.scalar.uint32;
                },
                0 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint32);
                    msg.*.duration = (f / 1000) - 0;
                },
                3 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.repetitions = rf.raw_value.scalar.uint16;
                },
                4 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint16);
                    msg.*.weight = (f / 16) - 0;
                },
                5 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.set_type = @enumFromInt(rf.raw_value.scalar.uint8);
                },
                6 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.start_time = rf.raw_value.scalar.uint32;
                },
                7 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.category = try allocator.alloc(ExerciseCategory, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        msg.*.category[i] = raw_value.uint16;
                    }
                },
                8 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.category_subtype = try allocator.alloc(u16, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        msg.*.category_subtype[i] = raw_value.uint16;
                    }
                },
                9 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.weight_display_unit = @enumFromInt(rf.raw_value.scalar.uint16);
                },
                10 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.message_index = @enumFromInt(rf.raw_value.scalar.uint16);
                },
                11 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.wkt_step_index = @enumFromInt(rf.raw_value.scalar.uint16);
                },
                else => {},
            }
        }
    }

    pub fn deinit(msg: SetMessage, allocator: std.mem.Allocator) void {
        if (msg.category != null and msg.category.?.len > 0) {
            allocator.free(msg.category.?);
        }
        if (msg.category_subtype != null and msg.category_subtype.?.len > 0) {
            allocator.free(msg.category_subtype.?);
        }
    }
};

pub const JumpMessage = struct {
    timestamp: ?u32 = null,
    distance: ?f32 = null,
    height: ?f32 = null,
    rotations: ?u8 = null,
    hang_time: ?f32 = null,
    /// A score for a jump calculated based on hang time, rotations, and distance.
    score: ?f32 = null,
    position_lat: ?i32 = null,
    position_long: ?i32 = null,
    speed: ?f32 = null,
    enhanced_speed: ?f32 = null,

    pub fn fromRawFields(msg: *JumpMessage, raw_fields: []const decoder.FieldData) !void {
        msg.* = .{};
        for (raw_fields) |rf| {
            switch (rf.id) {
                253 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.timestamp = rf.raw_value.scalar.uint32;
                },
                0 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .float32);
                    msg.*.distance = rf.raw_value.scalar.float32;
                },
                1 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .float32);
                    msg.*.height = rf.raw_value.scalar.float32;
                },
                2 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.rotations = rf.raw_value.scalar.uint8;
                },
                3 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .float32);
                    msg.*.hang_time = rf.raw_value.scalar.float32;
                },
                4 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .float32);
                    msg.*.score = rf.raw_value.scalar.float32;
                },
                5 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .sint32);
                    msg.*.position_lat = rf.raw_value.scalar.sint32;
                },
                6 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .sint32);
                    msg.*.position_long = rf.raw_value.scalar.sint32;
                },
                7 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint16);
                    msg.*.speed = (f / 1000) - 0;
                },
                8 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint32);
                    msg.*.enhanced_speed = (f / 1000) - 0;
                },
                else => {},
            }
        }
    }
};

pub const SplitMessage = struct {
    message_index: ?MessageIndex = null,
    split_type: ?SplitType = null,
    total_elapsed_time: ?f32 = null,
    total_timer_time: ?f32 = null,
    total_distance: ?f32 = null,
    avg_speed: ?f32 = null,
    start_time: ?u32 = null,
    total_ascent: ?u16 = null,
    total_descent: ?u16 = null,
    start_position_lat: ?i32 = null,
    start_position_long: ?i32 = null,
    end_position_lat: ?i32 = null,
    end_position_long: ?i32 = null,
    max_speed: ?f32 = null,
    avg_vert_speed: ?f32 = null,
    end_time: ?u32 = null,
    total_calories: ?u32 = null,
    start_elevation: ?f32 = null,
    /// Active time of split rounds
    active_time: ?f32 = null,
    total_moving_time: ?f32 = null,

    pub fn fromRawFields(msg: *SplitMessage, raw_fields: []const decoder.FieldData) !void {
        msg.* = .{};
        for (raw_fields) |rf| {
            switch (rf.id) {
                254 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.message_index = @enumFromInt(rf.raw_value.scalar.uint16);
                },
                0 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.split_type = @enumFromInt(rf.raw_value.scalar.enumeration);
                },
                1 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint32);
                    msg.*.total_elapsed_time = (f / 1000) - 0;
                },
                2 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint32);
                    msg.*.total_timer_time = (f / 1000) - 0;
                },
                3 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint32);
                    msg.*.total_distance = (f / 100) - 0;
                },
                4 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint32);
                    msg.*.avg_speed = (f / 1000) - 0;
                },
                9 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.start_time = rf.raw_value.scalar.uint32;
                },
                13 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.total_ascent = rf.raw_value.scalar.uint16;
                },
                14 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.total_descent = rf.raw_value.scalar.uint16;
                },
                21 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .sint32);
                    msg.*.start_position_lat = rf.raw_value.scalar.sint32;
                },
                22 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .sint32);
                    msg.*.start_position_long = rf.raw_value.scalar.sint32;
                },
                23 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .sint32);
                    msg.*.end_position_lat = rf.raw_value.scalar.sint32;
                },
                24 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .sint32);
                    msg.*.end_position_long = rf.raw_value.scalar.sint32;
                },
                25 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint32);
                    msg.*.max_speed = (f / 1000) - 0;
                },
                26 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .sint32);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.sint32);
                    msg.*.avg_vert_speed = (f / 1000) - 0;
                },
                27 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.end_time = rf.raw_value.scalar.uint32;
                },
                28 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.total_calories = rf.raw_value.scalar.uint32;
                },
                74 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint32);
                    msg.*.start_elevation = (f / 5) - 500;
                },
                78 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint32);
                    msg.*.active_time = (f / 1000) - 0;
                },
                110 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint32);
                    msg.*.total_moving_time = (f / 1000) - 0;
                },
                else => {},
            }
        }
    }
};

pub const SplitSummaryMessage = struct {
    message_index: ?MessageIndex = null,
    split_type: ?SplitType = null,
    num_splits: ?u16 = null,
    total_timer_time: ?f32 = null,
    total_distance: ?f32 = null,
    avg_speed: ?f32 = null,
    max_speed: ?f32 = null,
    total_ascent: ?u16 = null,
    total_descent: ?u16 = null,
    avg_heart_rate: ?u8 = null,
    max_heart_rate: ?u8 = null,
    avg_vert_speed: ?f32 = null,
    total_calories: ?u32 = null,
    /// total active time in all split rounds
    active_time: ?f32 = null,
    total_moving_time: ?f32 = null,

    pub fn fromRawFields(msg: *SplitSummaryMessage, raw_fields: []const decoder.FieldData) !void {
        msg.* = .{};
        for (raw_fields) |rf| {
            switch (rf.id) {
                254 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.message_index = @enumFromInt(rf.raw_value.scalar.uint16);
                },
                0 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.split_type = @enumFromInt(rf.raw_value.scalar.enumeration);
                },
                3 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.num_splits = rf.raw_value.scalar.uint16;
                },
                4 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint32);
                    msg.*.total_timer_time = (f / 1000) - 0;
                },
                5 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint32);
                    msg.*.total_distance = (f / 100) - 0;
                },
                6 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint32);
                    msg.*.avg_speed = (f / 1000) - 0;
                },
                7 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint32);
                    msg.*.max_speed = (f / 1000) - 0;
                },
                8 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.total_ascent = rf.raw_value.scalar.uint16;
                },
                9 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.total_descent = rf.raw_value.scalar.uint16;
                },
                10 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.avg_heart_rate = rf.raw_value.scalar.uint8;
                },
                11 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.max_heart_rate = rf.raw_value.scalar.uint8;
                },
                12 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .sint32);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.sint32);
                    msg.*.avg_vert_speed = (f / 1000) - 0;
                },
                13 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.total_calories = rf.raw_value.scalar.uint32;
                },
                65 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint32);
                    msg.*.active_time = (f / 1000) - 0;
                },
                77 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint32);
                    msg.*.total_moving_time = (f / 1000) - 0;
                },
                else => {},
            }
        }
    }
};

pub const ClimbProMessage = struct {
    timestamp: ?u32 = null,
    position_lat: ?i32 = null,
    position_long: ?i32 = null,
    climb_pro_event: ?ClimbProEvent = null,
    climb_number: ?u16 = null,
    climb_category: ?u8 = null,
    current_dist: ?f32 = null,

    pub fn fromRawFields(msg: *ClimbProMessage, raw_fields: []const decoder.FieldData) !void {
        msg.* = .{};
        for (raw_fields) |rf| {
            switch (rf.id) {
                253 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.timestamp = rf.raw_value.scalar.uint32;
                },
                0 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .sint32);
                    msg.*.position_lat = rf.raw_value.scalar.sint32;
                },
                1 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .sint32);
                    msg.*.position_long = rf.raw_value.scalar.sint32;
                },
                2 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.climb_pro_event = @enumFromInt(rf.raw_value.scalar.enumeration);
                },
                3 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.climb_number = rf.raw_value.scalar.uint16;
                },
                4 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.climb_category = rf.raw_value.scalar.uint8;
                },
                5 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .float32);
                    msg.*.current_dist = rf.raw_value.scalar.float32;
                },
                else => {},
            }
        }
    }
};

/// Must be logged before developer field is used
pub const FieldDescriptionMessage = struct {
    developer_data_index: ?u8 = null,
    field_definition_number: ?u8 = null,
    fit_base_type_id: ?FitBaseType = null,
    field_name: ?[:0]u8 = null,
    array: ?u8 = null,
    components: ?[:0]u8 = null,
    scale: ?u8 = null,
    offset: ?i8 = null,
    units: ?[:0]u8 = null,
    bits: ?[:0]u8 = null,
    accumulate: ?[:0]u8 = null,
    fit_base_unit_id: ?FitBaseUnit = null,
    native_mesg_num: ?MesgNum = null,
    native_field_num: ?u8 = null,

    pub fn fromRawFields(msg: *FieldDescriptionMessage, raw_fields: []const decoder.FieldData, allocator: std.mem.Allocator) !void {
        msg.* = .{};
        for (raw_fields) |rf| {
            switch (rf.id) {
                0 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.developer_data_index = rf.raw_value.scalar.uint8;
                },
                1 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.field_definition_number = rf.raw_value.scalar.uint8;
                },
                2 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.fit_base_type_id = @enumFromInt(rf.raw_value.scalar.uint8);
                },
                3 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .string);
                    msg.*.field_name = try allocator.alloc([:0]u8, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        msg.*.field_name[i] = raw_value.string;
                    }
                },
                4 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.array = rf.raw_value.scalar.uint8;
                },
                5 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .string);
                    msg.*.components = try allocator.dupeSentinel(u8, rf.raw_value.scalar.string, 0);
                },
                6 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.scale = rf.raw_value.scalar.uint8;
                },
                7 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .sint8);
                    msg.*.offset = rf.raw_value.scalar.sint8;
                },
                8 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .string);
                    msg.*.units = try allocator.alloc([:0]u8, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        msg.*.units[i] = raw_value.string;
                    }
                },
                9 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .string);
                    msg.*.bits = try allocator.dupeSentinel(u8, rf.raw_value.scalar.string, 0);
                },
                10 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .string);
                    msg.*.accumulate = try allocator.dupeSentinel(u8, rf.raw_value.scalar.string, 0);
                },
                13 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.fit_base_unit_id = @enumFromInt(rf.raw_value.scalar.uint16);
                },
                14 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.native_mesg_num = @enumFromInt(rf.raw_value.scalar.uint16);
                },
                15 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.native_field_num = rf.raw_value.scalar.uint8;
                },
                else => {},
            }
        }
    }

    pub fn deinit(msg: FieldDescriptionMessage, allocator: std.mem.Allocator) void {
        if (msg.field_name != null and msg.field_name.?.len > 0) {
            allocator.free(msg.field_name.?);
        }
        if (msg.components != null and msg.components.?.len > 0) {
            allocator.free(msg.components.?);
        }
        if (msg.units != null and msg.units.?.len > 0) {
            allocator.free(msg.units.?);
        }
        if (msg.bits != null and msg.bits.?.len > 0) {
            allocator.free(msg.bits.?);
        }
        if (msg.accumulate != null and msg.accumulate.?.len > 0) {
            allocator.free(msg.accumulate.?);
        }
    }
};

/// Must be logged before field description
pub const DeveloperDataIdMessage = struct {
    developer_id: ?[]u8 = null,
    application_id: ?[]u8 = null,
    manufacturer_id: ?Manufacturer = null,
    developer_data_index: ?u8 = null,
    application_version: ?u32 = null,

    pub fn fromRawFields(msg: *DeveloperDataIdMessage, raw_fields: []const decoder.FieldData, allocator: std.mem.Allocator) !void {
        msg.* = .{};
        for (raw_fields) |rf| {
            switch (rf.id) {
                0 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .byte);
                    msg.*.developer_id = try allocator.alloc(u8, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        msg.*.developer_id[i] = raw_value.byte;
                    }
                },
                1 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .byte);
                    msg.*.application_id = try allocator.alloc(u8, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        msg.*.application_id[i] = raw_value.byte;
                    }
                },
                2 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.manufacturer_id = @enumFromInt(rf.raw_value.scalar.uint16);
                },
                3 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.developer_data_index = rf.raw_value.scalar.uint8;
                },
                4 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.application_version = rf.raw_value.scalar.uint32;
                },
                else => {},
            }
        }
    }

    pub fn deinit(msg: DeveloperDataIdMessage, allocator: std.mem.Allocator) void {
        if (msg.developer_id != null and msg.developer_id.?.len > 0) {
            allocator.free(msg.developer_id.?);
        }
        if (msg.application_id != null and msg.application_id.?.len > 0) {
            allocator.free(msg.application_id.?);
        }
    }
};

pub const CourseMessage = struct {
    sport: ?Sport = null,
    name: ?[:0]u8 = null,
    capabilities: ?CourseCapabilities = null,
    sub_sport: ?SubSport = null,

    pub fn fromRawFields(msg: *CourseMessage, raw_fields: []const decoder.FieldData, allocator: std.mem.Allocator) !void {
        msg.* = .{};
        for (raw_fields) |rf| {
            switch (rf.id) {
                4 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.sport = @enumFromInt(rf.raw_value.scalar.enumeration);
                },
                5 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .string);
                    msg.*.name = try allocator.dupeSentinel(u8, rf.raw_value.scalar.string, 0);
                },
                6 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32z);
                    msg.*.capabilities = @enumFromInt(rf.raw_value.scalar.uint32z);
                },
                7 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.sub_sport = @enumFromInt(rf.raw_value.scalar.enumeration);
                },
                else => {},
            }
        }
    }

    pub fn deinit(msg: CourseMessage, allocator: std.mem.Allocator) void {
        if (msg.name != null and msg.name.?.len > 0) {
            allocator.free(msg.name.?);
        }
    }
};

pub const CoursePointMessage = struct {
    message_index: ?MessageIndex = null,
    timestamp: ?u32 = null,
    position_lat: ?i32 = null,
    position_long: ?i32 = null,
    distance: ?f32 = null,
    type: ?CoursePoint = null,
    name: ?[:0]u8 = null,
    favorite: ?bool = null,

    pub fn fromRawFields(msg: *CoursePointMessage, raw_fields: []const decoder.FieldData, allocator: std.mem.Allocator) !void {
        msg.* = .{};
        for (raw_fields) |rf| {
            switch (rf.id) {
                254 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.message_index = @enumFromInt(rf.raw_value.scalar.uint16);
                },
                1 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.timestamp = rf.raw_value.scalar.uint32;
                },
                2 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .sint32);
                    msg.*.position_lat = rf.raw_value.scalar.sint32;
                },
                3 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .sint32);
                    msg.*.position_long = rf.raw_value.scalar.sint32;
                },
                4 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint32);
                    msg.*.distance = (f / 100) - 0;
                },
                5 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.type = @enumFromInt(rf.raw_value.scalar.enumeration);
                },
                6 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .string);
                    msg.*.name = try allocator.dupeSentinel(u8, rf.raw_value.scalar.string, 0);
                },
                else => {},
            }
        }
    }

    pub fn deinit(msg: CoursePointMessage, allocator: std.mem.Allocator) void {
        if (msg.name != null and msg.name.?.len > 0) {
            allocator.free(msg.name.?);
        }
    }
};

/// Unique Identification data for a segment file
pub const SegmentIdMessage = struct {
    /// Friendly name assigned to segment
    name: ?[:0]u8 = null,
    /// UUID of the segment
    uuid: ?[:0]u8 = null,
    /// Sport associated with the segment
    sport: ?Sport = null,
    /// Segment enabled for evaluation
    enabled: ?bool = null,
    /// Primary key of the user that created the segment
    user_profile_primary_key: ?u32 = null,
    /// ID of the device that created the segment
    device_id: ?u32 = null,
    /// Index for the Leader Board entry selected as the default race participant
    default_race_leader: ?u8 = null,
    /// Indicates if any segments should be deleted
    delete_status: ?SegmentDeleteStatus = null,
    /// Indicates how the segment was selected to be sent to the device
    selection_type: ?SegmentSelectionType = null,

    pub fn fromRawFields(msg: *SegmentIdMessage, raw_fields: []const decoder.FieldData, allocator: std.mem.Allocator) !void {
        msg.* = .{};
        for (raw_fields) |rf| {
            switch (rf.id) {
                0 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .string);
                    msg.*.name = try allocator.dupeSentinel(u8, rf.raw_value.scalar.string, 0);
                },
                1 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .string);
                    msg.*.uuid = try allocator.dupeSentinel(u8, rf.raw_value.scalar.string, 0);
                },
                2 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.sport = @enumFromInt(rf.raw_value.scalar.enumeration);
                },
                4 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.user_profile_primary_key = rf.raw_value.scalar.uint32;
                },
                5 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.device_id = rf.raw_value.scalar.uint32;
                },
                6 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.default_race_leader = rf.raw_value.scalar.uint8;
                },
                7 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.delete_status = @enumFromInt(rf.raw_value.scalar.enumeration);
                },
                8 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.selection_type = @enumFromInt(rf.raw_value.scalar.enumeration);
                },
                else => {},
            }
        }
    }

    pub fn deinit(msg: SegmentIdMessage, allocator: std.mem.Allocator) void {
        if (msg.name != null and msg.name.?.len > 0) {
            allocator.free(msg.name.?);
        }
        if (msg.uuid != null and msg.uuid.?.len > 0) {
            allocator.free(msg.uuid.?);
        }
    }
};

/// Unique Identification data for an individual segment leader within a segment file
pub const SegmentLeaderboardEntryMessage = struct {
    message_index: ?MessageIndex = null,
    /// Friendly name assigned to leader
    name: ?[:0]u8 = null,
    /// Leader classification
    type: ?SegmentLeaderboardType = null,
    /// Primary user ID of this leader
    group_primary_key: ?u32 = null,
    /// ID of the activity associated with this leader time
    activity_id: ?u32 = null,
    /// Segment Time (includes pauses)
    segment_time: ?f32 = null,
    /// String version of the activity_id. 21 characters long, express in decimal
    activity_id_string: ?[:0]u8 = null,

    pub fn fromRawFields(msg: *SegmentLeaderboardEntryMessage, raw_fields: []const decoder.FieldData, allocator: std.mem.Allocator) !void {
        msg.* = .{};
        for (raw_fields) |rf| {
            switch (rf.id) {
                254 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.message_index = @enumFromInt(rf.raw_value.scalar.uint16);
                },
                0 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .string);
                    msg.*.name = try allocator.dupeSentinel(u8, rf.raw_value.scalar.string, 0);
                },
                1 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.type = @enumFromInt(rf.raw_value.scalar.enumeration);
                },
                2 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.group_primary_key = rf.raw_value.scalar.uint32;
                },
                3 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.activity_id = rf.raw_value.scalar.uint32;
                },
                4 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint32);
                    msg.*.segment_time = (f / 1000) - 0;
                },
                5 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .string);
                    msg.*.activity_id_string = try allocator.dupeSentinel(u8, rf.raw_value.scalar.string, 0);
                },
                else => {},
            }
        }
    }

    pub fn deinit(msg: SegmentLeaderboardEntryMessage, allocator: std.mem.Allocator) void {
        if (msg.name != null and msg.name.?.len > 0) {
            allocator.free(msg.name.?);
        }
        if (msg.activity_id_string != null and msg.activity_id_string.?.len > 0) {
            allocator.free(msg.activity_id_string.?);
        }
    }
};

/// Navigation and race evaluation point for a segment decribing a point along the segment path and time it took each segment leader to reach that point
pub const SegmentPointMessage = struct {
    message_index: ?MessageIndex = null,
    position_lat: ?i32 = null,
    position_long: ?i32 = null,
    /// Accumulated distance along the segment at the described point
    distance: ?f32 = null,
    /// Accumulated altitude along the segment at the described point
    altitude: ?f32 = null,
    /// Accumualted time each leader board member required to reach the described point. This value is zero for all leader board members at the starting point of the segment.
    leader_time: ?[]f32 = null,
    /// Accumulated altitude along the segment at the described point
    enhanced_altitude: ?f32 = null,

    pub fn fromRawFields(msg: *SegmentPointMessage, raw_fields: []const decoder.FieldData, allocator: std.mem.Allocator) !void {
        msg.* = .{};
        for (raw_fields) |rf| {
            switch (rf.id) {
                254 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.message_index = @enumFromInt(rf.raw_value.scalar.uint16);
                },
                1 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .sint32);
                    msg.*.position_lat = rf.raw_value.scalar.sint32;
                },
                2 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .sint32);
                    msg.*.position_long = rf.raw_value.scalar.sint32;
                },
                3 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint32);
                    msg.*.distance = (f / 100) - 0;
                },
                4 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint16);
                    msg.*.altitude = (f / 5) - 500;
                },
                5 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.leader_time = try allocator.alloc(f32, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        const f: f32 = @floatFromInt(raw_value.uint32);
                        msg.*.leader_time.?[i] = (f / 1000) - 0;
                    }
                },
                6 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint32);
                    msg.*.enhanced_altitude = (f / 5) - 500;
                },
                else => {},
            }
        }
    }

    pub fn deinit(msg: SegmentPointMessage, allocator: std.mem.Allocator) void {
        if (msg.leader_time != null and msg.leader_time.?.len > 0) {
            allocator.free(msg.leader_time.?);
        }
    }
};

pub const SegmentLapMessage = struct {
    message_index: ?MessageIndex = null,
    timestamp: ?u32 = null,
    event: ?Event = null,
    event_type: ?EventType = null,
    start_time: ?u32 = null,
    start_position_lat: ?i32 = null,
    start_position_long: ?i32 = null,
    end_position_lat: ?i32 = null,
    end_position_long: ?i32 = null,
    /// Time (includes pauses)
    total_elapsed_time: ?f32 = null,
    /// Timer Time (excludes pauses)
    total_timer_time: ?f32 = null,
    total_distance: ?f32 = null,
    total_calories: ?u16 = null,
    /// If New Leaf
    total_fat_calories: ?u16 = null,
    avg_speed: ?f32 = null,
    max_speed: ?f32 = null,
    avg_heart_rate: ?u8 = null,
    max_heart_rate: ?u8 = null,
    /// total_cycles / total_timer_time if non_zero_avg_cadence otherwise total_cycles / total_elapsed_time
    avg_cadence: ?u8 = null,
    max_cadence: ?u8 = null,
    /// total_power / total_timer_time if non_zero_avg_power otherwise total_power / total_elapsed_time
    avg_power: ?u16 = null,
    max_power: ?u16 = null,
    total_ascent: ?u16 = null,
    total_descent: ?u16 = null,
    sport: ?Sport = null,
    event_group: ?u8 = null,
    /// North east corner latitude.
    nec_lat: ?i32 = null,
    /// North east corner longitude.
    nec_long: ?i32 = null,
    /// South west corner latitude.
    swc_lat: ?i32 = null,
    /// South west corner latitude.
    swc_long: ?i32 = null,
    name: ?[:0]u8 = null,
    normalized_power: ?u16 = null,
    left_right_balance: ?LeftRightBalance100 = null,
    sub_sport: ?SubSport = null,
    total_work: ?u32 = null,
    avg_altitude: ?f32 = null,
    max_altitude: ?f32 = null,
    gps_accuracy: ?u8 = null,
    avg_grade: ?f32 = null,
    avg_pos_grade: ?f32 = null,
    avg_neg_grade: ?f32 = null,
    max_pos_grade: ?f32 = null,
    max_neg_grade: ?f32 = null,
    avg_temperature: ?i8 = null,
    max_temperature: ?i8 = null,
    total_moving_time: ?f32 = null,
    avg_pos_vertical_speed: ?f32 = null,
    avg_neg_vertical_speed: ?f32 = null,
    max_pos_vertical_speed: ?f32 = null,
    max_neg_vertical_speed: ?f32 = null,
    time_in_hr_zone: ?[]f32 = null,
    time_in_speed_zone: ?[]f32 = null,
    time_in_cadence_zone: ?[]f32 = null,
    time_in_power_zone: ?[]f32 = null,
    repetition_num: ?u16 = null,
    min_altitude: ?f32 = null,
    min_heart_rate: ?u8 = null,
    active_time: ?f32 = null,
    wkt_step_index: ?MessageIndex = null,
    sport_event: ?SportEvent = null,
    avg_left_torque_effectiveness: ?f32 = null,
    avg_right_torque_effectiveness: ?f32 = null,
    avg_left_pedal_smoothness: ?f32 = null,
    avg_right_pedal_smoothness: ?f32 = null,
    avg_combined_pedal_smoothness: ?f32 = null,
    status: ?SegmentLapStatus = null,
    uuid: ?[:0]u8 = null,
    /// fractional part of the avg_cadence
    avg_fractional_cadence: ?f32 = null,
    /// fractional part of the max_cadence
    max_fractional_cadence: ?f32 = null,
    /// fractional part of the total_cycles
    total_fractional_cycles: ?f32 = null,
    front_gear_shift_count: ?u16 = null,
    rear_gear_shift_count: ?u16 = null,
    /// Total time spent in the standing position
    time_standing: ?f32 = null,
    /// Number of transitions to the standing state
    stand_count: ?u16 = null,
    /// Average left platform center offset
    avg_left_pco: ?i8 = null,
    /// Average right platform center offset
    avg_right_pco: ?i8 = null,
    /// Average left power phase angles. Data value indexes defined by power_phase_type.
    avg_left_power_phase: ?[]f32 = null,
    /// Average left power phase peak angles. Data value indexes defined by power_phase_type.
    avg_left_power_phase_peak: ?[]f32 = null,
    /// Average right power phase angles. Data value indexes defined by power_phase_type.
    avg_right_power_phase: ?[]f32 = null,
    /// Average right power phase peak angles. Data value indexes defined by power_phase_type.
    avg_right_power_phase_peak: ?[]f32 = null,
    /// Average power by position. Data value indexes defined by rider_position_type.
    avg_power_position: ?[]u16 = null,
    /// Maximum power by position. Data value indexes defined by rider_position_type.
    max_power_position: ?[]u16 = null,
    /// Average cadence by position. Data value indexes defined by rider_position_type.
    avg_cadence_position: ?[]u8 = null,
    /// Maximum cadence by position. Data value indexes defined by rider_position_type.
    max_cadence_position: ?[]u8 = null,
    /// Manufacturer that produced the segment
    manufacturer: ?Manufacturer = null,
    /// The grit score estimates how challenging a route could be for a cyclist in terms of time spent going over sharp turns or large grade slopes.
    total_grit: ?f32 = null,
    /// The flow score estimates how long distance wise a cyclist deaccelerates over intervals where deacceleration is unnecessary such as smooth turns or small grade angle intervals.
    total_flow: ?f32 = null,
    /// The grit score estimates how challenging a route could be for a cyclist in terms of time spent going over sharp turns or large grade slopes.
    avg_grit: ?f32 = null,
    /// The flow score estimates how long distance wise a cyclist deaccelerates over intervals where deacceleration is unnecessary such as smooth turns or small grade angle intervals.
    avg_flow: ?f32 = null,
    /// fractional part of total_ascent
    total_fractional_ascent: ?f32 = null,
    /// fractional part of total_descent
    total_fractional_descent: ?f32 = null,
    enhanced_avg_altitude: ?f32 = null,
    enhanced_max_altitude: ?f32 = null,
    enhanced_min_altitude: ?f32 = null,

    pub fn fromRawFields(msg: *SegmentLapMessage, raw_fields: []const decoder.FieldData, allocator: std.mem.Allocator) !void {
        msg.* = .{};
        for (raw_fields) |rf| {
            switch (rf.id) {
                254 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.message_index = @enumFromInt(rf.raw_value.scalar.uint16);
                },
                253 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.timestamp = rf.raw_value.scalar.uint32;
                },
                0 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.event = @enumFromInt(rf.raw_value.scalar.enumeration);
                },
                1 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.event_type = @enumFromInt(rf.raw_value.scalar.enumeration);
                },
                2 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.start_time = rf.raw_value.scalar.uint32;
                },
                3 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .sint32);
                    msg.*.start_position_lat = rf.raw_value.scalar.sint32;
                },
                4 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .sint32);
                    msg.*.start_position_long = rf.raw_value.scalar.sint32;
                },
                5 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .sint32);
                    msg.*.end_position_lat = rf.raw_value.scalar.sint32;
                },
                6 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .sint32);
                    msg.*.end_position_long = rf.raw_value.scalar.sint32;
                },
                7 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint32);
                    msg.*.total_elapsed_time = (f / 1000) - 0;
                },
                8 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint32);
                    msg.*.total_timer_time = (f / 1000) - 0;
                },
                9 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint32);
                    msg.*.total_distance = (f / 100) - 0;
                },
                11 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.total_calories = rf.raw_value.scalar.uint16;
                },
                12 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.total_fat_calories = rf.raw_value.scalar.uint16;
                },
                13 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint16);
                    msg.*.avg_speed = (f / 1000) - 0;
                },
                14 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint16);
                    msg.*.max_speed = (f / 1000) - 0;
                },
                15 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.avg_heart_rate = rf.raw_value.scalar.uint8;
                },
                16 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.max_heart_rate = rf.raw_value.scalar.uint8;
                },
                17 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.avg_cadence = rf.raw_value.scalar.uint8;
                },
                18 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.max_cadence = rf.raw_value.scalar.uint8;
                },
                19 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.avg_power = rf.raw_value.scalar.uint16;
                },
                20 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.max_power = rf.raw_value.scalar.uint16;
                },
                21 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.total_ascent = rf.raw_value.scalar.uint16;
                },
                22 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.total_descent = rf.raw_value.scalar.uint16;
                },
                23 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.sport = @enumFromInt(rf.raw_value.scalar.enumeration);
                },
                24 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.event_group = rf.raw_value.scalar.uint8;
                },
                25 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .sint32);
                    msg.*.nec_lat = rf.raw_value.scalar.sint32;
                },
                26 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .sint32);
                    msg.*.nec_long = rf.raw_value.scalar.sint32;
                },
                27 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .sint32);
                    msg.*.swc_lat = rf.raw_value.scalar.sint32;
                },
                28 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .sint32);
                    msg.*.swc_long = rf.raw_value.scalar.sint32;
                },
                29 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .string);
                    msg.*.name = try allocator.dupeSentinel(u8, rf.raw_value.scalar.string, 0);
                },
                30 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.normalized_power = rf.raw_value.scalar.uint16;
                },
                31 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.left_right_balance = @enumFromInt(rf.raw_value.scalar.uint16);
                },
                32 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.sub_sport = @enumFromInt(rf.raw_value.scalar.enumeration);
                },
                33 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.total_work = rf.raw_value.scalar.uint32;
                },
                34 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint16);
                    msg.*.avg_altitude = (f / 5) - 500;
                },
                35 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint16);
                    msg.*.max_altitude = (f / 5) - 500;
                },
                36 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.gps_accuracy = rf.raw_value.scalar.uint8;
                },
                37 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .sint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.sint16);
                    msg.*.avg_grade = (f / 100) - 0;
                },
                38 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .sint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.sint16);
                    msg.*.avg_pos_grade = (f / 100) - 0;
                },
                39 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .sint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.sint16);
                    msg.*.avg_neg_grade = (f / 100) - 0;
                },
                40 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .sint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.sint16);
                    msg.*.max_pos_grade = (f / 100) - 0;
                },
                41 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .sint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.sint16);
                    msg.*.max_neg_grade = (f / 100) - 0;
                },
                42 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .sint8);
                    msg.*.avg_temperature = rf.raw_value.scalar.sint8;
                },
                43 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .sint8);
                    msg.*.max_temperature = rf.raw_value.scalar.sint8;
                },
                44 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint32);
                    msg.*.total_moving_time = (f / 1000) - 0;
                },
                45 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .sint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.sint16);
                    msg.*.avg_pos_vertical_speed = (f / 1000) - 0;
                },
                46 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .sint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.sint16);
                    msg.*.avg_neg_vertical_speed = (f / 1000) - 0;
                },
                47 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .sint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.sint16);
                    msg.*.max_pos_vertical_speed = (f / 1000) - 0;
                },
                48 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .sint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.sint16);
                    msg.*.max_neg_vertical_speed = (f / 1000) - 0;
                },
                49 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.time_in_hr_zone = try allocator.alloc(f32, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        const f: f32 = @floatFromInt(raw_value.uint32);
                        msg.*.time_in_hr_zone.?[i] = (f / 1000) - 0;
                    }
                },
                50 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.time_in_speed_zone = try allocator.alloc(f32, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        const f: f32 = @floatFromInt(raw_value.uint32);
                        msg.*.time_in_speed_zone.?[i] = (f / 1000) - 0;
                    }
                },
                51 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.time_in_cadence_zone = try allocator.alloc(f32, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        const f: f32 = @floatFromInt(raw_value.uint32);
                        msg.*.time_in_cadence_zone.?[i] = (f / 1000) - 0;
                    }
                },
                52 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.time_in_power_zone = try allocator.alloc(f32, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        const f: f32 = @floatFromInt(raw_value.uint32);
                        msg.*.time_in_power_zone.?[i] = (f / 1000) - 0;
                    }
                },
                53 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.repetition_num = rf.raw_value.scalar.uint16;
                },
                54 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint16);
                    msg.*.min_altitude = (f / 5) - 500;
                },
                55 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.min_heart_rate = rf.raw_value.scalar.uint8;
                },
                56 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint32);
                    msg.*.active_time = (f / 1000) - 0;
                },
                57 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.wkt_step_index = @enumFromInt(rf.raw_value.scalar.uint16);
                },
                58 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.sport_event = @enumFromInt(rf.raw_value.scalar.enumeration);
                },
                59 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint8);
                    msg.*.avg_left_torque_effectiveness = (f / 2) - 0;
                },
                60 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint8);
                    msg.*.avg_right_torque_effectiveness = (f / 2) - 0;
                },
                61 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint8);
                    msg.*.avg_left_pedal_smoothness = (f / 2) - 0;
                },
                62 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint8);
                    msg.*.avg_right_pedal_smoothness = (f / 2) - 0;
                },
                63 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint8);
                    msg.*.avg_combined_pedal_smoothness = (f / 2) - 0;
                },
                64 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.status = @enumFromInt(rf.raw_value.scalar.enumeration);
                },
                65 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .string);
                    msg.*.uuid = try allocator.dupeSentinel(u8, rf.raw_value.scalar.string, 0);
                },
                66 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint8);
                    msg.*.avg_fractional_cadence = (f / 128) - 0;
                },
                67 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint8);
                    msg.*.max_fractional_cadence = (f / 128) - 0;
                },
                68 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint8);
                    msg.*.total_fractional_cycles = (f / 128) - 0;
                },
                69 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.front_gear_shift_count = rf.raw_value.scalar.uint16;
                },
                70 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.rear_gear_shift_count = rf.raw_value.scalar.uint16;
                },
                71 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint32);
                    msg.*.time_standing = (f / 1000) - 0;
                },
                72 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.stand_count = rf.raw_value.scalar.uint16;
                },
                73 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .sint8);
                    msg.*.avg_left_pco = rf.raw_value.scalar.sint8;
                },
                74 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .sint8);
                    msg.*.avg_right_pco = rf.raw_value.scalar.sint8;
                },
                75 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.avg_left_power_phase = try allocator.alloc(f32, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        const f: f32 = @floatFromInt(raw_value.uint8);
                        msg.*.avg_left_power_phase.?[i] = (f / 0.7111111) - 0;
                    }
                },
                76 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.avg_left_power_phase_peak = try allocator.alloc(f32, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        const f: f32 = @floatFromInt(raw_value.uint8);
                        msg.*.avg_left_power_phase_peak.?[i] = (f / 0.7111111) - 0;
                    }
                },
                77 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.avg_right_power_phase = try allocator.alloc(f32, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        const f: f32 = @floatFromInt(raw_value.uint8);
                        msg.*.avg_right_power_phase.?[i] = (f / 0.7111111) - 0;
                    }
                },
                78 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.avg_right_power_phase_peak = try allocator.alloc(f32, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        const f: f32 = @floatFromInt(raw_value.uint8);
                        msg.*.avg_right_power_phase_peak.?[i] = (f / 0.7111111) - 0;
                    }
                },
                79 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.avg_power_position = try allocator.alloc(u16, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        msg.*.avg_power_position[i] = raw_value.uint16;
                    }
                },
                80 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.max_power_position = try allocator.alloc(u16, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        msg.*.max_power_position[i] = raw_value.uint16;
                    }
                },
                81 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.avg_cadence_position = try allocator.alloc(u8, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        msg.*.avg_cadence_position[i] = raw_value.uint8;
                    }
                },
                82 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.max_cadence_position = try allocator.alloc(u8, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        msg.*.max_cadence_position[i] = raw_value.uint8;
                    }
                },
                83 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.manufacturer = @enumFromInt(rf.raw_value.scalar.uint16);
                },
                84 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .float32);
                    msg.*.total_grit = rf.raw_value.scalar.float32;
                },
                85 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .float32);
                    msg.*.total_flow = rf.raw_value.scalar.float32;
                },
                86 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .float32);
                    msg.*.avg_grit = rf.raw_value.scalar.float32;
                },
                87 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .float32);
                    msg.*.avg_flow = rf.raw_value.scalar.float32;
                },
                89 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint8);
                    msg.*.total_fractional_ascent = (f / 100) - 0;
                },
                90 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint8);
                    msg.*.total_fractional_descent = (f / 100) - 0;
                },
                91 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint32);
                    msg.*.enhanced_avg_altitude = (f / 5) - 500;
                },
                92 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint32);
                    msg.*.enhanced_max_altitude = (f / 5) - 500;
                },
                93 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint32);
                    msg.*.enhanced_min_altitude = (f / 5) - 500;
                },
                else => {},
            }
        }
    }

    pub fn deinit(msg: SegmentLapMessage, allocator: std.mem.Allocator) void {
        if (msg.name != null and msg.name.?.len > 0) {
            allocator.free(msg.name.?);
        }
        if (msg.time_in_hr_zone != null and msg.time_in_hr_zone.?.len > 0) {
            allocator.free(msg.time_in_hr_zone.?);
        }
        if (msg.time_in_speed_zone != null and msg.time_in_speed_zone.?.len > 0) {
            allocator.free(msg.time_in_speed_zone.?);
        }
        if (msg.time_in_cadence_zone != null and msg.time_in_cadence_zone.?.len > 0) {
            allocator.free(msg.time_in_cadence_zone.?);
        }
        if (msg.time_in_power_zone != null and msg.time_in_power_zone.?.len > 0) {
            allocator.free(msg.time_in_power_zone.?);
        }
        if (msg.uuid != null and msg.uuid.?.len > 0) {
            allocator.free(msg.uuid.?);
        }
        if (msg.avg_left_power_phase != null and msg.avg_left_power_phase.?.len > 0) {
            allocator.free(msg.avg_left_power_phase.?);
        }
        if (msg.avg_left_power_phase_peak != null and msg.avg_left_power_phase_peak.?.len > 0) {
            allocator.free(msg.avg_left_power_phase_peak.?);
        }
        if (msg.avg_right_power_phase != null and msg.avg_right_power_phase.?.len > 0) {
            allocator.free(msg.avg_right_power_phase.?);
        }
        if (msg.avg_right_power_phase_peak != null and msg.avg_right_power_phase_peak.?.len > 0) {
            allocator.free(msg.avg_right_power_phase_peak.?);
        }
        if (msg.avg_power_position != null and msg.avg_power_position.?.len > 0) {
            allocator.free(msg.avg_power_position.?);
        }
        if (msg.max_power_position != null and msg.max_power_position.?.len > 0) {
            allocator.free(msg.max_power_position.?);
        }
        if (msg.avg_cadence_position != null and msg.avg_cadence_position.?.len > 0) {
            allocator.free(msg.avg_cadence_position.?);
        }
        if (msg.max_cadence_position != null and msg.max_cadence_position.?.len > 0) {
            allocator.free(msg.max_cadence_position.?);
        }
    }
};

/// Summary of the unique segment and leaderboard information associated with a segment file. This message is used to compile a segment list file describing all segment files on a device. The segment list file is used when refreshing the contents of a segment file with the latest available leaderboard information.
pub const SegmentFileMessage = struct {
    message_index: ?MessageIndex = null,
    /// UUID of the segment file
    file_uuid: ?[:0]u8 = null,
    /// Enabled state of the segment file
    enabled: ?bool = null,
    /// Primary key of the user that created the segment file
    user_profile_primary_key: ?u32 = null,
    /// Leader type of each leader in the segment file
    leader_type: ?[]SegmentLeaderboardType = null,
    /// Group primary key of each leader in the segment file
    leader_group_primary_key: ?[]u32 = null,
    /// Activity ID of each leader in the segment file
    leader_activity_id: ?[]u32 = null,
    /// String version of the activity ID of each leader in the segment file. 21 characters long for each ID, express in decimal
    leader_activity_id_string: ?[:0]u8 = null,
    /// Index for the Leader Board entry selected as the default race participant
    default_race_leader: ?u8 = null,

    pub fn fromRawFields(msg: *SegmentFileMessage, raw_fields: []const decoder.FieldData, allocator: std.mem.Allocator) !void {
        msg.* = .{};
        for (raw_fields) |rf| {
            switch (rf.id) {
                254 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.message_index = @enumFromInt(rf.raw_value.scalar.uint16);
                },
                1 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .string);
                    msg.*.file_uuid = try allocator.dupeSentinel(u8, rf.raw_value.scalar.string, 0);
                },
                4 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.user_profile_primary_key = rf.raw_value.scalar.uint32;
                },
                7 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.leader_type = try allocator.alloc(SegmentLeaderboardType, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        msg.*.leader_type[i] = raw_value.enumeration;
                    }
                },
                8 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.leader_group_primary_key = try allocator.alloc(u32, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        msg.*.leader_group_primary_key[i] = raw_value.uint32;
                    }
                },
                9 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.leader_activity_id = try allocator.alloc(u32, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        msg.*.leader_activity_id[i] = raw_value.uint32;
                    }
                },
                10 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .string);
                    msg.*.leader_activity_id_string = try allocator.alloc([:0]u8, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        msg.*.leader_activity_id_string[i] = raw_value.string;
                    }
                },
                11 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.default_race_leader = rf.raw_value.scalar.uint8;
                },
                else => {},
            }
        }
    }

    pub fn deinit(msg: SegmentFileMessage, allocator: std.mem.Allocator) void {
        if (msg.file_uuid != null and msg.file_uuid.?.len > 0) {
            allocator.free(msg.file_uuid.?);
        }
        if (msg.leader_type != null and msg.leader_type.?.len > 0) {
            allocator.free(msg.leader_type.?);
        }
        if (msg.leader_group_primary_key != null and msg.leader_group_primary_key.?.len > 0) {
            allocator.free(msg.leader_group_primary_key.?);
        }
        if (msg.leader_activity_id != null and msg.leader_activity_id.?.len > 0) {
            allocator.free(msg.leader_activity_id.?);
        }
        if (msg.leader_activity_id_string != null and msg.leader_activity_id_string.?.len > 0) {
            allocator.free(msg.leader_activity_id_string.?);
        }
    }
};

pub const WorkoutMessage = struct {
    message_index: ?MessageIndex = null,
    sport: ?Sport = null,
    capabilities: ?WorkoutCapabilities = null,
    /// number of valid steps
    num_valid_steps: ?u16 = null,
    wkt_name: ?[:0]u8 = null,
    sub_sport: ?SubSport = null,
    pool_length: ?f32 = null,
    pool_length_unit: ?DisplayMeasure = null,
    /// Description of the workout
    wkt_description: ?[:0]u8 = null,

    pub fn fromRawFields(msg: *WorkoutMessage, raw_fields: []const decoder.FieldData, allocator: std.mem.Allocator) !void {
        msg.* = .{};
        for (raw_fields) |rf| {
            switch (rf.id) {
                254 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.message_index = @enumFromInt(rf.raw_value.scalar.uint16);
                },
                4 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.sport = @enumFromInt(rf.raw_value.scalar.enumeration);
                },
                5 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32z);
                    msg.*.capabilities = @enumFromInt(rf.raw_value.scalar.uint32z);
                },
                6 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.num_valid_steps = rf.raw_value.scalar.uint16;
                },
                8 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .string);
                    msg.*.wkt_name = try allocator.dupeSentinel(u8, rf.raw_value.scalar.string, 0);
                },
                11 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.sub_sport = @enumFromInt(rf.raw_value.scalar.enumeration);
                },
                14 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint16);
                    msg.*.pool_length = (f / 100) - 0;
                },
                15 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.pool_length_unit = @enumFromInt(rf.raw_value.scalar.enumeration);
                },
                17 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .string);
                    msg.*.wkt_description = try allocator.dupeSentinel(u8, rf.raw_value.scalar.string, 0);
                },
                else => {},
            }
        }
    }

    pub fn deinit(msg: WorkoutMessage, allocator: std.mem.Allocator) void {
        if (msg.wkt_name != null and msg.wkt_name.?.len > 0) {
            allocator.free(msg.wkt_name.?);
        }
        if (msg.wkt_description != null and msg.wkt_description.?.len > 0) {
            allocator.free(msg.wkt_description.?);
        }
    }
};

pub const WorkoutSessionMessage = struct {
    message_index: ?MessageIndex = null,
    sport: ?Sport = null,
    sub_sport: ?SubSport = null,
    num_valid_steps: ?u16 = null,
    first_step_index: ?u16 = null,
    pool_length: ?f32 = null,
    pool_length_unit: ?DisplayMeasure = null,

    pub fn fromRawFields(msg: *WorkoutSessionMessage, raw_fields: []const decoder.FieldData) !void {
        msg.* = .{};
        for (raw_fields) |rf| {
            switch (rf.id) {
                254 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.message_index = @enumFromInt(rf.raw_value.scalar.uint16);
                },
                0 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.sport = @enumFromInt(rf.raw_value.scalar.enumeration);
                },
                1 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.sub_sport = @enumFromInt(rf.raw_value.scalar.enumeration);
                },
                2 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.num_valid_steps = rf.raw_value.scalar.uint16;
                },
                3 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.first_step_index = rf.raw_value.scalar.uint16;
                },
                4 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint16);
                    msg.*.pool_length = (f / 100) - 0;
                },
                5 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.pool_length_unit = @enumFromInt(rf.raw_value.scalar.enumeration);
                },
                else => {},
            }
        }
    }
};

pub const WorkoutStepMessage = struct {
    message_index: ?MessageIndex = null,
    wkt_step_name: ?[:0]u8 = null,
    duration_type: ?WktStepDuration = null,
    target_type: ?WktStepTarget = null,
    intensity: ?Intensity = null,
    notes: ?[:0]u8 = null,
    equipment: ?WorkoutEquipment = null,
    exercise_category: ?ExerciseCategory = null,
    exercise_name: ?u16 = null,
    exercise_weight: ?f32 = null,
    weight_display_unit: ?FitBaseUnit = null,
    secondary_target_type: ?WktStepTarget = null,

    pub fn fromRawFields(msg: *WorkoutStepMessage, raw_fields: []const decoder.FieldData, allocator: std.mem.Allocator) !void {
        msg.* = .{};
        for (raw_fields) |rf| {
            switch (rf.id) {
                254 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.message_index = @enumFromInt(rf.raw_value.scalar.uint16);
                },
                0 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .string);
                    msg.*.wkt_step_name = try allocator.dupeSentinel(u8, rf.raw_value.scalar.string, 0);
                },
                1 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.duration_type = @enumFromInt(rf.raw_value.scalar.enumeration);
                },
                3 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.target_type = @enumFromInt(rf.raw_value.scalar.enumeration);
                },
                7 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.intensity = @enumFromInt(rf.raw_value.scalar.enumeration);
                },
                8 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .string);
                    msg.*.notes = try allocator.dupeSentinel(u8, rf.raw_value.scalar.string, 0);
                },
                9 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.equipment = @enumFromInt(rf.raw_value.scalar.enumeration);
                },
                10 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.exercise_category = @enumFromInt(rf.raw_value.scalar.uint16);
                },
                11 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.exercise_name = rf.raw_value.scalar.uint16;
                },
                12 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint16);
                    msg.*.exercise_weight = (f / 100) - 0;
                },
                13 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.weight_display_unit = @enumFromInt(rf.raw_value.scalar.uint16);
                },
                19 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.secondary_target_type = @enumFromInt(rf.raw_value.scalar.enumeration);
                },
                else => {},
            }
        }
    }

    pub fn deinit(msg: WorkoutStepMessage, allocator: std.mem.Allocator) void {
        if (msg.wkt_step_name != null and msg.wkt_step_name.?.len > 0) {
            allocator.free(msg.wkt_step_name.?);
        }
        if (msg.notes != null and msg.notes.?.len > 0) {
            allocator.free(msg.notes.?);
        }
    }
};

pub const ExerciseTitleMessage = struct {
    message_index: ?MessageIndex = null,
    exercise_category: ?ExerciseCategory = null,
    exercise_name: ?u16 = null,
    wkt_step_name: ?[:0]u8 = null,

    pub fn fromRawFields(msg: *ExerciseTitleMessage, raw_fields: []const decoder.FieldData, allocator: std.mem.Allocator) !void {
        msg.* = .{};
        for (raw_fields) |rf| {
            switch (rf.id) {
                254 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.message_index = @enumFromInt(rf.raw_value.scalar.uint16);
                },
                0 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.exercise_category = @enumFromInt(rf.raw_value.scalar.uint16);
                },
                1 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.exercise_name = rf.raw_value.scalar.uint16;
                },
                2 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .string);
                    msg.*.wkt_step_name = try allocator.alloc([:0]u8, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        msg.*.wkt_step_name[i] = raw_value.string;
                    }
                },
                else => {},
            }
        }
    }

    pub fn deinit(msg: ExerciseTitleMessage, allocator: std.mem.Allocator) void {
        if (msg.wkt_step_name != null and msg.wkt_step_name.?.len > 0) {
            allocator.free(msg.wkt_step_name.?);
        }
    }
};

pub const ScheduleMessage = struct {
    /// Corresponds to file_id of scheduled workout / course.
    manufacturer: ?Manufacturer = null,
    /// Corresponds to file_id of scheduled workout / course.
    serial_number: ?u32 = null,
    /// Corresponds to file_id of scheduled workout / course.
    time_created: ?u32 = null,
    /// TRUE if this activity has been started
    completed: ?bool = null,
    type: ?Schedule = null,
    scheduled_time: ?u32 = null,

    pub fn fromRawFields(msg: *ScheduleMessage, raw_fields: []const decoder.FieldData) !void {
        msg.* = .{};
        for (raw_fields) |rf| {
            switch (rf.id) {
                0 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.manufacturer = @enumFromInt(rf.raw_value.scalar.uint16);
                },
                2 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32z);
                    msg.*.serial_number = rf.raw_value.scalar.uint32z;
                },
                3 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.time_created = rf.raw_value.scalar.uint32;
                },
                5 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.type = @enumFromInt(rf.raw_value.scalar.enumeration);
                },
                6 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.scheduled_time = rf.raw_value.scalar.uint32;
                },
                else => {},
            }
        }
    }
};

pub const TotalsMessage = struct {
    message_index: ?MessageIndex = null,
    timestamp: ?u32 = null,
    /// Excludes pauses
    timer_time: ?u32 = null,
    distance: ?u32 = null,
    calories: ?u32 = null,
    sport: ?Sport = null,
    /// Includes pauses
    elapsed_time: ?u32 = null,
    sessions: ?u16 = null,
    active_time: ?u32 = null,
    sport_index: ?u8 = null,

    pub fn fromRawFields(msg: *TotalsMessage, raw_fields: []const decoder.FieldData) !void {
        msg.* = .{};
        for (raw_fields) |rf| {
            switch (rf.id) {
                254 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.message_index = @enumFromInt(rf.raw_value.scalar.uint16);
                },
                253 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.timestamp = rf.raw_value.scalar.uint32;
                },
                0 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.timer_time = rf.raw_value.scalar.uint32;
                },
                1 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.distance = rf.raw_value.scalar.uint32;
                },
                2 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.calories = rf.raw_value.scalar.uint32;
                },
                3 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.sport = @enumFromInt(rf.raw_value.scalar.enumeration);
                },
                4 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.elapsed_time = rf.raw_value.scalar.uint32;
                },
                5 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.sessions = rf.raw_value.scalar.uint16;
                },
                6 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.active_time = rf.raw_value.scalar.uint32;
                },
                9 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.sport_index = rf.raw_value.scalar.uint8;
                },
                else => {},
            }
        }
    }
};

pub const WeightScaleMessage = struct {
    timestamp: ?u32 = null,
    weight: ?f32 = null,
    percent_fat: ?f32 = null,
    percent_hydration: ?f32 = null,
    visceral_fat_mass: ?f32 = null,
    bone_mass: ?f32 = null,
    muscle_mass: ?f32 = null,
    basal_met: ?f32 = null,
    physique_rating: ?u8 = null,
    /// ~4kJ per kcal, 0.25 allows max 16384 kcal
    active_met: ?f32 = null,
    metabolic_age: ?u8 = null,
    visceral_fat_rating: ?u8 = null,
    /// Associates this weight scale message to a user. This corresponds to the index of the user profile message in the weight scale file.
    user_profile_index: ?MessageIndex = null,
    bmi: ?f32 = null,

    pub fn fromRawFields(msg: *WeightScaleMessage, raw_fields: []const decoder.FieldData) !void {
        msg.* = .{};
        for (raw_fields) |rf| {
            switch (rf.id) {
                253 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.timestamp = rf.raw_value.scalar.uint32;
                },
                0 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint16);
                    msg.*.weight = (f / 100) - 0;
                },
                1 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint16);
                    msg.*.percent_fat = (f / 100) - 0;
                },
                2 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint16);
                    msg.*.percent_hydration = (f / 100) - 0;
                },
                3 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint16);
                    msg.*.visceral_fat_mass = (f / 100) - 0;
                },
                4 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint16);
                    msg.*.bone_mass = (f / 100) - 0;
                },
                5 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint16);
                    msg.*.muscle_mass = (f / 100) - 0;
                },
                7 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint16);
                    msg.*.basal_met = (f / 4) - 0;
                },
                8 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.physique_rating = rf.raw_value.scalar.uint8;
                },
                9 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint16);
                    msg.*.active_met = (f / 4) - 0;
                },
                10 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.metabolic_age = rf.raw_value.scalar.uint8;
                },
                11 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.visceral_fat_rating = rf.raw_value.scalar.uint8;
                },
                12 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.user_profile_index = @enumFromInt(rf.raw_value.scalar.uint16);
                },
                13 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint16);
                    msg.*.bmi = (f / 10) - 0;
                },
                else => {},
            }
        }
    }
};

pub const BloodPressureMessage = struct {
    timestamp: ?u32 = null,
    systolic_pressure: ?u16 = null,
    diastolic_pressure: ?u16 = null,
    mean_arterial_pressure: ?u16 = null,
    map_3_sample_mean: ?u16 = null,
    map_morning_values: ?u16 = null,
    map_evening_values: ?u16 = null,
    heart_rate: ?u8 = null,
    heart_rate_type: ?HrType = null,
    status: ?BpStatus = null,
    /// Associates this blood pressure message to a user. This corresponds to the index of the user profile message in the blood pressure file.
    user_profile_index: ?MessageIndex = null,

    pub fn fromRawFields(msg: *BloodPressureMessage, raw_fields: []const decoder.FieldData) !void {
        msg.* = .{};
        for (raw_fields) |rf| {
            switch (rf.id) {
                253 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.timestamp = rf.raw_value.scalar.uint32;
                },
                0 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.systolic_pressure = rf.raw_value.scalar.uint16;
                },
                1 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.diastolic_pressure = rf.raw_value.scalar.uint16;
                },
                2 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.mean_arterial_pressure = rf.raw_value.scalar.uint16;
                },
                3 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.map_3_sample_mean = rf.raw_value.scalar.uint16;
                },
                4 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.map_morning_values = rf.raw_value.scalar.uint16;
                },
                5 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.map_evening_values = rf.raw_value.scalar.uint16;
                },
                6 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.heart_rate = rf.raw_value.scalar.uint8;
                },
                7 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.heart_rate_type = @enumFromInt(rf.raw_value.scalar.enumeration);
                },
                8 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.status = @enumFromInt(rf.raw_value.scalar.enumeration);
                },
                9 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.user_profile_index = @enumFromInt(rf.raw_value.scalar.uint16);
                },
                else => {},
            }
        }
    }
};

pub const MonitoringInfoMessage = struct {
    timestamp: ?u32 = null,
    /// Use to convert activity timestamps to local time if device does not support time zone and daylight savings time correction.
    local_timestamp: ?u32 = null,
    activity_type: ?[]ActivityType = null,
    /// Indexed by activity_type
    cycles_to_distance: ?[]f32 = null,
    /// Indexed by activity_type
    cycles_to_calories: ?[]f32 = null,
    resting_metabolic_rate: ?u16 = null,

    pub fn fromRawFields(msg: *MonitoringInfoMessage, raw_fields: []const decoder.FieldData, allocator: std.mem.Allocator) !void {
        msg.* = .{};
        for (raw_fields) |rf| {
            switch (rf.id) {
                253 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.timestamp = rf.raw_value.scalar.uint32;
                },
                0 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.local_timestamp = rf.raw_value.scalar.uint32;
                },
                1 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.activity_type = try allocator.alloc(ActivityType, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        msg.*.activity_type[i] = raw_value.enumeration;
                    }
                },
                3 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.cycles_to_distance = try allocator.alloc(f32, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        const f: f32 = @floatFromInt(raw_value.uint16);
                        msg.*.cycles_to_distance.?[i] = (f / 5000) - 0;
                    }
                },
                4 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.cycles_to_calories = try allocator.alloc(f32, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        const f: f32 = @floatFromInt(raw_value.uint16);
                        msg.*.cycles_to_calories.?[i] = (f / 5000) - 0;
                    }
                },
                5 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.resting_metabolic_rate = rf.raw_value.scalar.uint16;
                },
                else => {},
            }
        }
    }

    pub fn deinit(msg: MonitoringInfoMessage, allocator: std.mem.Allocator) void {
        if (msg.activity_type != null and msg.activity_type.?.len > 0) {
            allocator.free(msg.activity_type.?);
        }
        if (msg.cycles_to_distance != null and msg.cycles_to_distance.?.len > 0) {
            allocator.free(msg.cycles_to_distance.?);
        }
        if (msg.cycles_to_calories != null and msg.cycles_to_calories.?.len > 0) {
            allocator.free(msg.cycles_to_calories.?);
        }
    }
};

pub const MonitoringMessage = struct {
    /// Must align to logging interval, for example, time must be 00:00:00 for daily log.
    timestamp: ?u32 = null,
    /// Associates this data to device_info message. Not required for file with single device (sensor).
    device_index: ?DeviceIndex = null,
    /// Accumulated total calories. Maintained by MonitoringReader for each activity_type. See SDK documentation
    calories: ?u16 = null,
    /// Accumulated distance. Maintained by MonitoringReader for each activity_type. See SDK documentation.
    distance: ?f32 = null,
    active_time: ?f32 = null,
    activity_type: ?ActivityType = null,
    activity_subtype: ?ActivitySubtype = null,
    activity_level: ?ActivityLevel = null,
    distance_16: ?u16 = null,
    cycles_16: ?u16 = null,
    active_time_16: ?u16 = null,
    /// Must align to logging interval, for example, time must be 00:00:00 for daily log.
    local_timestamp: ?u32 = null,
    /// Avg temperature during the logging interval ended at timestamp
    temperature: ?f32 = null,
    /// Min temperature during the logging interval ended at timestamp
    temperature_min: ?f32 = null,
    /// Max temperature during the logging interval ended at timestamp
    temperature_max: ?f32 = null,
    /// Indexed using minute_activity_level enum
    activity_time: ?[]u16 = null,
    active_calories: ?u16 = null,
    /// Indicates single type / intensity for duration since last monitoring message.
    current_activity_type_intensity: ?u8 = null,
    timestamp_min_8: ?u8 = null,
    timestamp_16: ?u16 = null,
    heart_rate: ?u8 = null,
    intensity: ?f32 = null,
    duration_min: ?u16 = null,
    duration: ?u32 = null,
    ascent: ?f32 = null,
    descent: ?f32 = null,
    moderate_activity_minutes: ?u16 = null,
    vigorous_activity_minutes: ?u16 = null,

    pub fn fromRawFields(msg: *MonitoringMessage, raw_fields: []const decoder.FieldData, allocator: std.mem.Allocator) !void {
        msg.* = .{};
        for (raw_fields) |rf| {
            switch (rf.id) {
                253 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.timestamp = rf.raw_value.scalar.uint32;
                },
                0 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.device_index = @enumFromInt(rf.raw_value.scalar.uint8);
                },
                1 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.calories = rf.raw_value.scalar.uint16;
                },
                2 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint32);
                    msg.*.distance = (f / 100) - 0;
                },
                4 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint32);
                    msg.*.active_time = (f / 1000) - 0;
                },
                5 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.activity_type = @enumFromInt(rf.raw_value.scalar.enumeration);
                },
                6 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.activity_subtype = @enumFromInt(rf.raw_value.scalar.enumeration);
                },
                7 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.activity_level = @enumFromInt(rf.raw_value.scalar.enumeration);
                },
                8 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.distance_16 = rf.raw_value.scalar.uint16;
                },
                9 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.cycles_16 = rf.raw_value.scalar.uint16;
                },
                10 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.active_time_16 = rf.raw_value.scalar.uint16;
                },
                11 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.local_timestamp = rf.raw_value.scalar.uint32;
                },
                12 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .sint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.sint16);
                    msg.*.temperature = (f / 100) - 0;
                },
                14 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .sint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.sint16);
                    msg.*.temperature_min = (f / 100) - 0;
                },
                15 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .sint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.sint16);
                    msg.*.temperature_max = (f / 100) - 0;
                },
                16 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.activity_time = try allocator.alloc(u16, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        msg.*.activity_time[i] = raw_value.uint16;
                    }
                },
                19 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.active_calories = rf.raw_value.scalar.uint16;
                },
                24 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .byte);
                    msg.*.current_activity_type_intensity = rf.raw_value.scalar.byte;
                },
                25 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.timestamp_min_8 = rf.raw_value.scalar.uint8;
                },
                26 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.timestamp_16 = rf.raw_value.scalar.uint16;
                },
                27 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.heart_rate = rf.raw_value.scalar.uint8;
                },
                28 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint8);
                    msg.*.intensity = (f / 10) - 0;
                },
                29 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.duration_min = rf.raw_value.scalar.uint16;
                },
                30 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.duration = rf.raw_value.scalar.uint32;
                },
                31 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint32);
                    msg.*.ascent = (f / 1000) - 0;
                },
                32 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint32);
                    msg.*.descent = (f / 1000) - 0;
                },
                33 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.moderate_activity_minutes = rf.raw_value.scalar.uint16;
                },
                34 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.vigorous_activity_minutes = rf.raw_value.scalar.uint16;
                },
                else => {},
            }
        }
    }

    pub fn deinit(msg: MonitoringMessage, allocator: std.mem.Allocator) void {
        if (msg.activity_time != null and msg.activity_time.?.len > 0) {
            allocator.free(msg.activity_time.?);
        }
    }
};

pub const MonitoringHrDataMessage = struct {
    /// Must align to logging interval, for example, time must be 00:00:00 for daily log.
    timestamp: ?u32 = null,
    /// 7-day rolling average
    resting_heart_rate: ?u8 = null,
    /// RHR for today only. (Feeds into 7-day average)
    current_day_resting_heart_rate: ?u8 = null,

    pub fn fromRawFields(msg: *MonitoringHrDataMessage, raw_fields: []const decoder.FieldData) !void {
        msg.* = .{};
        for (raw_fields) |rf| {
            switch (rf.id) {
                253 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.timestamp = rf.raw_value.scalar.uint32;
                },
                0 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.resting_heart_rate = rf.raw_value.scalar.uint8;
                },
                1 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.current_day_resting_heart_rate = rf.raw_value.scalar.uint8;
                },
                else => {},
            }
        }
    }
};

pub const Spo2DataMessage = struct {
    timestamp: ?u32 = null,
    reading_spo2: ?f32 = null,
    reading_confidence: ?f32 = null,
    /// Mode when data was captured
    mode: ?Spo2MeasurementType = null,

    pub fn fromRawFields(msg: *Spo2DataMessage, raw_fields: []const decoder.FieldData) !void {
        msg.* = .{};
        for (raw_fields) |rf| {
            switch (rf.id) {
                253 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.timestamp = rf.raw_value.scalar.uint32;
                },
                0 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint8);
                    msg.*.reading_spo2 = (f / 1) - 0;
                },
                1 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint8);
                    msg.*.reading_confidence = (f / 1) - 0;
                },
                2 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.mode = @enumFromInt(rf.raw_value.scalar.enumeration);
                },
                else => {},
            }
        }
    }
};

pub const HrMessage = struct {
    timestamp: ?u32 = null,
    fractional_timestamp: ?f32 = null,
    time256: ?f32 = null,
    filtered_bpm: ?[]u8 = null,
    event_timestamp: ?[]f32 = null,
    event_timestamp_12: ?[]u8 = null,

    pub fn fromRawFields(msg: *HrMessage, raw_fields: []const decoder.FieldData, allocator: std.mem.Allocator) !void {
        msg.* = .{};
        for (raw_fields) |rf| {
            switch (rf.id) {
                253 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.timestamp = rf.raw_value.scalar.uint32;
                },
                0 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint16);
                    msg.*.fractional_timestamp = (f / 32768) - 0;
                },
                1 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint8);
                    msg.*.time256 = (f / 256) - 0;
                },
                6 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.filtered_bpm = try allocator.alloc(u8, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        msg.*.filtered_bpm[i] = raw_value.uint8;
                    }
                },
                9 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.event_timestamp = try allocator.alloc(f32, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        const f: f32 = @floatFromInt(raw_value.uint32);
                        msg.*.event_timestamp.?[i] = (f / 1024) - 0;
                    }
                },
                10 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .byte);
                    msg.*.event_timestamp_12 = try allocator.alloc(u8, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        msg.*.event_timestamp_12[i] = raw_value.byte;
                    }
                },
                else => {},
            }
        }
    }

    pub fn deinit(msg: HrMessage, allocator: std.mem.Allocator) void {
        if (msg.filtered_bpm != null and msg.filtered_bpm.?.len > 0) {
            allocator.free(msg.filtered_bpm.?);
        }
        if (msg.event_timestamp != null and msg.event_timestamp.?.len > 0) {
            allocator.free(msg.event_timestamp.?);
        }
        if (msg.event_timestamp_12 != null and msg.event_timestamp_12.?.len > 0) {
            allocator.free(msg.event_timestamp_12.?);
        }
    }
};

/// Value from 1 to 100 calculated by FirstBeat
pub const StressLevelMessage = struct {
    stress_level_value: ?i16 = null,
    /// Time stress score was calculated
    stress_level_time: ?u32 = null,

    pub fn fromRawFields(msg: *StressLevelMessage, raw_fields: []const decoder.FieldData) !void {
        msg.* = .{};
        for (raw_fields) |rf| {
            switch (rf.id) {
                0 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .sint16);
                    msg.*.stress_level_value = rf.raw_value.scalar.sint16;
                },
                1 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.stress_level_time = rf.raw_value.scalar.uint32;
                },
                else => {},
            }
        }
    }
};

pub const MaxMetDataMessage = struct {
    /// Time maxMET and vo2 were calculated
    update_time: ?u32 = null,
    vo2_max: ?f32 = null,
    sport: ?Sport = null,
    sub_sport: ?SubSport = null,
    max_met_category: ?MaxMetCategory = null,
    /// Indicates if calibrated data was used in the calculation
    calibrated_data: ?bool = null,
    /// Indicates if the estimate was obtained using a chest strap or wrist heart rate
    hr_source: ?MaxMetHeartRateSource = null,
    /// Indidcates if the estimate was obtained using onboard GPS or connected GPS
    speed_source: ?MaxMetSpeedSource = null,

    pub fn fromRawFields(msg: *MaxMetDataMessage, raw_fields: []const decoder.FieldData) !void {
        msg.* = .{};
        for (raw_fields) |rf| {
            switch (rf.id) {
                0 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.update_time = rf.raw_value.scalar.uint32;
                },
                2 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint16);
                    msg.*.vo2_max = (f / 10) - 0;
                },
                5 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.sport = @enumFromInt(rf.raw_value.scalar.enumeration);
                },
                6 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.sub_sport = @enumFromInt(rf.raw_value.scalar.enumeration);
                },
                8 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.max_met_category = @enumFromInt(rf.raw_value.scalar.enumeration);
                },
                12 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.hr_source = @enumFromInt(rf.raw_value.scalar.enumeration);
                },
                13 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.speed_source = @enumFromInt(rf.raw_value.scalar.enumeration);
                },
                else => {},
            }
        }
    }
};

/// Body battery data used for HSA custom data logging
pub const HsaBodyBatteryDataMessage = struct {
    timestamp: ?u32 = null,
    /// Processing interval length in seconds
    processing_interval: ?u16 = null,
    /// Body battery level: [0,100] Blank: -16
    level: ?[]i8 = null,
    /// Body battery charged value
    charged: ?[]i16 = null,
    /// Body battery uncharged value
    uncharged: ?[]i16 = null,

    pub fn fromRawFields(msg: *HsaBodyBatteryDataMessage, raw_fields: []const decoder.FieldData, allocator: std.mem.Allocator) !void {
        msg.* = .{};
        for (raw_fields) |rf| {
            switch (rf.id) {
                253 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.timestamp = rf.raw_value.scalar.uint32;
                },
                0 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.processing_interval = rf.raw_value.scalar.uint16;
                },
                1 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .sint8);
                    msg.*.level = try allocator.alloc(i8, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        msg.*.level[i] = raw_value.sint8;
                    }
                },
                2 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .sint16);
                    msg.*.charged = try allocator.alloc(i16, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        msg.*.charged[i] = raw_value.sint16;
                    }
                },
                3 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .sint16);
                    msg.*.uncharged = try allocator.alloc(i16, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        msg.*.uncharged[i] = raw_value.sint16;
                    }
                },
                else => {},
            }
        }
    }

    pub fn deinit(msg: HsaBodyBatteryDataMessage, allocator: std.mem.Allocator) void {
        if (msg.level != null and msg.level.?.len > 0) {
            allocator.free(msg.level.?);
        }
        if (msg.charged != null and msg.charged.?.len > 0) {
            allocator.free(msg.charged.?);
        }
        if (msg.uncharged != null and msg.uncharged.?.len > 0) {
            allocator.free(msg.uncharged.?);
        }
    }
};

/// HSA events
pub const HsaEventMessage = struct {
    timestamp: ?u32 = null,
    /// Event ID. Health SDK use only
    event_id: ?u8 = null,

    pub fn fromRawFields(msg: *HsaEventMessage, raw_fields: []const decoder.FieldData) !void {
        msg.* = .{};
        for (raw_fields) |rf| {
            switch (rf.id) {
                253 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.timestamp = rf.raw_value.scalar.uint32;
                },
                0 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.event_id = rf.raw_value.scalar.uint8;
                },
                else => {},
            }
        }
    }
};

/// Raw accelerometer data used for HSA custom data logging
pub const HsaAccelerometerDataMessage = struct {
    timestamp: ?u32 = null,
    /// Millisecond resolution of the timestamp
    timestamp_ms: ?u16 = null,
    /// Sampling Interval in Milliseconds
    sampling_interval: ?u16 = null,
    /// X-Axis Measurement
    accel_x: ?[]f32 = null,
    /// Y-Axis Measurement
    accel_y: ?[]f32 = null,
    /// Z-Axis Measurement
    accel_z: ?[]f32 = null,
    /// 32 kHz timestamp
    timestamp_32k: ?u32 = null,

    pub fn fromRawFields(msg: *HsaAccelerometerDataMessage, raw_fields: []const decoder.FieldData, allocator: std.mem.Allocator) !void {
        msg.* = .{};
        for (raw_fields) |rf| {
            switch (rf.id) {
                253 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.timestamp = rf.raw_value.scalar.uint32;
                },
                0 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.timestamp_ms = rf.raw_value.scalar.uint16;
                },
                1 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.sampling_interval = rf.raw_value.scalar.uint16;
                },
                2 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .sint16);
                    msg.*.accel_x = try allocator.alloc(f32, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        const f: f32 = @floatFromInt(raw_value.sint16);
                        msg.*.accel_x.?[i] = (f / 1.024) - 0;
                    }
                },
                3 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .sint16);
                    msg.*.accel_y = try allocator.alloc(f32, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        const f: f32 = @floatFromInt(raw_value.sint16);
                        msg.*.accel_y.?[i] = (f / 1.024) - 0;
                    }
                },
                4 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .sint16);
                    msg.*.accel_z = try allocator.alloc(f32, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        const f: f32 = @floatFromInt(raw_value.sint16);
                        msg.*.accel_z.?[i] = (f / 1.024) - 0;
                    }
                },
                5 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.timestamp_32k = rf.raw_value.scalar.uint32;
                },
                else => {},
            }
        }
    }

    pub fn deinit(msg: HsaAccelerometerDataMessage, allocator: std.mem.Allocator) void {
        if (msg.accel_x != null and msg.accel_x.?.len > 0) {
            allocator.free(msg.accel_x.?);
        }
        if (msg.accel_y != null and msg.accel_y.?.len > 0) {
            allocator.free(msg.accel_y.?);
        }
        if (msg.accel_z != null and msg.accel_z.?.len > 0) {
            allocator.free(msg.accel_z.?);
        }
    }
};

pub const HsaGyroscopeDataMessage = struct {
    timestamp: ?u32 = null,
    /// Millisecond resolution of the timestamp
    timestamp_ms: ?u16 = null,
    /// Sampling Interval in 32 kHz timescale
    sampling_interval: ?u16 = null,
    /// X-Axis Measurement
    gyro_x: ?[]f32 = null,
    /// Y-Axis Measurement
    gyro_y: ?[]f32 = null,
    /// Z-Axis Measurement
    gyro_z: ?[]f32 = null,
    /// 32 kHz timestamp
    timestamp_32k: ?u32 = null,

    pub fn fromRawFields(msg: *HsaGyroscopeDataMessage, raw_fields: []const decoder.FieldData, allocator: std.mem.Allocator) !void {
        msg.* = .{};
        for (raw_fields) |rf| {
            switch (rf.id) {
                253 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.timestamp = rf.raw_value.scalar.uint32;
                },
                0 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.timestamp_ms = rf.raw_value.scalar.uint16;
                },
                1 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.sampling_interval = rf.raw_value.scalar.uint16;
                },
                2 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .sint16);
                    msg.*.gyro_x = try allocator.alloc(f32, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        const f: f32 = @floatFromInt(raw_value.sint16);
                        msg.*.gyro_x.?[i] = (f / 28.57143) - 0;
                    }
                },
                3 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .sint16);
                    msg.*.gyro_y = try allocator.alloc(f32, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        const f: f32 = @floatFromInt(raw_value.sint16);
                        msg.*.gyro_y.?[i] = (f / 28.57143) - 0;
                    }
                },
                4 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .sint16);
                    msg.*.gyro_z = try allocator.alloc(f32, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        const f: f32 = @floatFromInt(raw_value.sint16);
                        msg.*.gyro_z.?[i] = (f / 28.57143) - 0;
                    }
                },
                5 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.timestamp_32k = rf.raw_value.scalar.uint32;
                },
                else => {},
            }
        }
    }

    pub fn deinit(msg: HsaGyroscopeDataMessage, allocator: std.mem.Allocator) void {
        if (msg.gyro_x != null and msg.gyro_x.?.len > 0) {
            allocator.free(msg.gyro_x.?);
        }
        if (msg.gyro_y != null and msg.gyro_y.?.len > 0) {
            allocator.free(msg.gyro_y.?);
        }
        if (msg.gyro_z != null and msg.gyro_z.?.len > 0) {
            allocator.free(msg.gyro_z.?);
        }
    }
};

/// User's current daily step data used for HSA custom data logging
pub const HsaStepDataMessage = struct {
    timestamp: ?u32 = null,
    /// Processing interval length in seconds. File start: 0xFFFFFFEF File stop: 0xFFFFFFEE
    processing_interval: ?u16 = null,
    /// Total step sum
    steps: ?[]f32 = null,

    pub fn fromRawFields(msg: *HsaStepDataMessage, raw_fields: []const decoder.FieldData, allocator: std.mem.Allocator) !void {
        msg.* = .{};
        for (raw_fields) |rf| {
            switch (rf.id) {
                253 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.timestamp = rf.raw_value.scalar.uint32;
                },
                0 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.processing_interval = rf.raw_value.scalar.uint16;
                },
                1 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.steps = try allocator.alloc(f32, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        const f: f32 = @floatFromInt(raw_value.uint32);
                        msg.*.steps.?[i] = (f / 1) - 0;
                    }
                },
                else => {},
            }
        }
    }

    pub fn deinit(msg: HsaStepDataMessage, allocator: std.mem.Allocator) void {
        if (msg.steps != null and msg.steps.?.len > 0) {
            allocator.free(msg.steps.?);
        }
    }
};

/// User's current SpO2 data used for HSA custom data logging
pub const HsaSpo2DataMessage = struct {
    timestamp: ?u32 = null,
    /// Processing interval length in seconds
    processing_interval: ?u16 = null,
    /// SpO2 Reading: [70,100] Blank: 240
    reading_spo2: ?[]u8 = null,
    /// SpO2 Confidence: [0,254]
    confidence: ?[]u8 = null,

    pub fn fromRawFields(msg: *HsaSpo2DataMessage, raw_fields: []const decoder.FieldData, allocator: std.mem.Allocator) !void {
        msg.* = .{};
        for (raw_fields) |rf| {
            switch (rf.id) {
                253 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.timestamp = rf.raw_value.scalar.uint32;
                },
                0 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.processing_interval = rf.raw_value.scalar.uint16;
                },
                1 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.reading_spo2 = try allocator.alloc(u8, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        msg.*.reading_spo2[i] = raw_value.uint8;
                    }
                },
                2 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.confidence = try allocator.alloc(u8, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        msg.*.confidence[i] = raw_value.uint8;
                    }
                },
                else => {},
            }
        }
    }

    pub fn deinit(msg: HsaSpo2DataMessage, allocator: std.mem.Allocator) void {
        if (msg.reading_spo2 != null and msg.reading_spo2.?.len > 0) {
            allocator.free(msg.reading_spo2.?);
        }
        if (msg.confidence != null and msg.confidence.?.len > 0) {
            allocator.free(msg.confidence.?);
        }
    }
};

/// User's current stress data used for HSA custom data logging
pub const HsaStressDataMessage = struct {
    timestamp: ?u32 = null,
    /// Processing interval length in seconds
    processing_interval: ?u16 = null,
    /// Stress Level: [0,100] Off wrist: -1 Excess motion: -2 Not enough data: -3 Recovering from exercise: -4 Unidentified: -5 Blank: -16
    stress_level: ?[]f32 = null,

    pub fn fromRawFields(msg: *HsaStressDataMessage, raw_fields: []const decoder.FieldData, allocator: std.mem.Allocator) !void {
        msg.* = .{};
        for (raw_fields) |rf| {
            switch (rf.id) {
                253 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.timestamp = rf.raw_value.scalar.uint32;
                },
                0 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.processing_interval = rf.raw_value.scalar.uint16;
                },
                1 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .sint8);
                    msg.*.stress_level = try allocator.alloc(f32, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        const f: f32 = @floatFromInt(raw_value.sint8);
                        msg.*.stress_level.?[i] = (f / 1) - 0;
                    }
                },
                else => {},
            }
        }
    }

    pub fn deinit(msg: HsaStressDataMessage, allocator: std.mem.Allocator) void {
        if (msg.stress_level != null and msg.stress_level.?.len > 0) {
            allocator.free(msg.stress_level.?);
        }
    }
};

/// User's current respiration data used for HSA custom data logging
pub const HsaRespirationDataMessage = struct {
    timestamp: ?u32 = null,
    /// Processing interval length in seconds
    processing_interval: ?u16 = null,
    /// Breaths / min: [1,100] Invalid: 255 Excess motion: 254 Off wrist: 253 Not available: 252 Blank: 2.4
    respiration_rate: ?[]f32 = null,

    pub fn fromRawFields(msg: *HsaRespirationDataMessage, raw_fields: []const decoder.FieldData, allocator: std.mem.Allocator) !void {
        msg.* = .{};
        for (raw_fields) |rf| {
            switch (rf.id) {
                253 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.timestamp = rf.raw_value.scalar.uint32;
                },
                0 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.processing_interval = rf.raw_value.scalar.uint16;
                },
                1 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .sint16);
                    msg.*.respiration_rate = try allocator.alloc(f32, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        const f: f32 = @floatFromInt(raw_value.sint16);
                        msg.*.respiration_rate.?[i] = (f / 100) - 0;
                    }
                },
                else => {},
            }
        }
    }

    pub fn deinit(msg: HsaRespirationDataMessage, allocator: std.mem.Allocator) void {
        if (msg.respiration_rate != null and msg.respiration_rate.?.len > 0) {
            allocator.free(msg.respiration_rate.?);
        }
    }
};

/// User's current heart rate data used for HSA custom data logging
pub const HsaHeartRateDataMessage = struct {
    timestamp: ?u32 = null,
    /// Processing interval length in seconds
    processing_interval: ?u16 = null,
    /// Status of measurements in buffer - 0 indicates SEARCHING 1 indicates LOCKED
    status: ?u8 = null,
    /// Beats / min. Blank: 0
    heart_rate: ?[]f32 = null,

    pub fn fromRawFields(msg: *HsaHeartRateDataMessage, raw_fields: []const decoder.FieldData, allocator: std.mem.Allocator) !void {
        msg.* = .{};
        for (raw_fields) |rf| {
            switch (rf.id) {
                253 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.timestamp = rf.raw_value.scalar.uint32;
                },
                0 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.processing_interval = rf.raw_value.scalar.uint16;
                },
                1 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.status = rf.raw_value.scalar.uint8;
                },
                2 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.heart_rate = try allocator.alloc(f32, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        const f: f32 = @floatFromInt(raw_value.uint8);
                        msg.*.heart_rate.?[i] = (f / 1) - 0;
                    }
                },
                else => {},
            }
        }
    }

    pub fn deinit(msg: HsaHeartRateDataMessage, allocator: std.mem.Allocator) void {
        if (msg.heart_rate != null and msg.heart_rate.?.len > 0) {
            allocator.free(msg.heart_rate.?);
        }
    }
};

/// Configuration data for HSA custom data logging
pub const HsaConfigurationDataMessage = struct {
    /// Encoded configuration data
    timestamp: ?u32 = null,
    /// Encoded configuration data. Health SDK use only
    data: ?[]u8 = null,
    /// Size in bytes of data field
    data_size: ?u8 = null,

    pub fn fromRawFields(msg: *HsaConfigurationDataMessage, raw_fields: []const decoder.FieldData, allocator: std.mem.Allocator) !void {
        msg.* = .{};
        for (raw_fields) |rf| {
            switch (rf.id) {
                253 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.timestamp = rf.raw_value.scalar.uint32;
                },
                0 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .byte);
                    msg.*.data = try allocator.alloc(u8, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        msg.*.data[i] = raw_value.byte;
                    }
                },
                1 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.data_size = rf.raw_value.scalar.uint8;
                },
                else => {},
            }
        }
    }

    pub fn deinit(msg: HsaConfigurationDataMessage, allocator: std.mem.Allocator) void {
        if (msg.data != null and msg.data.?.len > 0) {
            allocator.free(msg.data.?);
        }
    }
};

/// Wrist temperature data used for HSA custom data logging
pub const HsaWristTemperatureDataMessage = struct {
    timestamp: ?u32 = null,
    /// Processing interval length in seconds
    processing_interval: ?u16 = null,
    /// Wrist temperature reading
    value: ?[]f32 = null,

    pub fn fromRawFields(msg: *HsaWristTemperatureDataMessage, raw_fields: []const decoder.FieldData, allocator: std.mem.Allocator) !void {
        msg.* = .{};
        for (raw_fields) |rf| {
            switch (rf.id) {
                253 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.timestamp = rf.raw_value.scalar.uint32;
                },
                0 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.processing_interval = rf.raw_value.scalar.uint16;
                },
                1 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.value = try allocator.alloc(f32, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        const f: f32 = @floatFromInt(raw_value.uint16);
                        msg.*.value.?[i] = (f / 1000) - 0;
                    }
                },
                else => {},
            }
        }
    }

    pub fn deinit(msg: HsaWristTemperatureDataMessage, allocator: std.mem.Allocator) void {
        if (msg.value != null and msg.value.?.len > 0) {
            allocator.free(msg.value.?);
        }
    }
};

pub const MemoGlobMessage = struct {
    /// Sequence number of memo blocks
    part_index: ?u32 = null,
    /// Deprecated. Use data field.
    memo: ?[]u8 = null,
    /// Message Number of the parent message
    mesg_num: ?MesgNum = null,
    /// Index of mesg that this glob is associated with.
    parent_index: ?MessageIndex = null,
    /// Field within the parent that this glob is associated with
    field_num: ?u8 = null,
    /// Block of utf8 bytes. Note, mutltibyte characters may be split across adjoining memo_glob messages.
    data: ?[]u8 = null,

    pub fn fromRawFields(msg: *MemoGlobMessage, raw_fields: []const decoder.FieldData, allocator: std.mem.Allocator) !void {
        msg.* = .{};
        for (raw_fields) |rf| {
            switch (rf.id) {
                250 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.part_index = rf.raw_value.scalar.uint32;
                },
                0 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .byte);
                    msg.*.memo = try allocator.alloc(u8, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        msg.*.memo[i] = raw_value.byte;
                    }
                },
                1 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.mesg_num = @enumFromInt(rf.raw_value.scalar.uint16);
                },
                2 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.parent_index = @enumFromInt(rf.raw_value.scalar.uint16);
                },
                3 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.field_num = rf.raw_value.scalar.uint8;
                },
                4 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8z);
                    msg.*.data = try allocator.alloc(u8, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        msg.*.data[i] = raw_value.uint8z;
                    }
                },
                else => {},
            }
        }
    }

    pub fn deinit(msg: MemoGlobMessage, allocator: std.mem.Allocator) void {
        if (msg.memo != null and msg.memo.?.len > 0) {
            allocator.free(msg.memo.?);
        }
        if (msg.data != null and msg.data.?.len > 0) {
            allocator.free(msg.data.?);
        }
    }
};

pub const SleepLevelMessage = struct {
    timestamp: ?u32 = null,
    sleep_level: ?SleepLevel = null,

    pub fn fromRawFields(msg: *SleepLevelMessage, raw_fields: []const decoder.FieldData) !void {
        msg.* = .{};
        for (raw_fields) |rf| {
            switch (rf.id) {
                253 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.timestamp = rf.raw_value.scalar.uint32;
                },
                0 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.sleep_level = @enumFromInt(rf.raw_value.scalar.enumeration);
                },
                else => {},
            }
        }
    }
};

pub const AntChannelIdMessage = struct {
    channel_number: ?u8 = null,
    device_type: ?u8 = null,
    device_number: ?u16 = null,
    transmission_type: ?u8 = null,
    device_index: ?DeviceIndex = null,

    pub fn fromRawFields(msg: *AntChannelIdMessage, raw_fields: []const decoder.FieldData) !void {
        msg.* = .{};
        for (raw_fields) |rf| {
            switch (rf.id) {
                0 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.channel_number = rf.raw_value.scalar.uint8;
                },
                1 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8z);
                    msg.*.device_type = rf.raw_value.scalar.uint8z;
                },
                2 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16z);
                    msg.*.device_number = rf.raw_value.scalar.uint16z;
                },
                3 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8z);
                    msg.*.transmission_type = rf.raw_value.scalar.uint8z;
                },
                4 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.device_index = @enumFromInt(rf.raw_value.scalar.uint8);
                },
                else => {},
            }
        }
    }
};

pub const AntRxMessage = struct {
    timestamp: ?u32 = null,
    fractional_timestamp: ?f32 = null,
    mesg_id: ?u8 = null,
    mesg_data: ?[]u8 = null,
    channel_number: ?u8 = null,
    data: ?[]u8 = null,

    pub fn fromRawFields(msg: *AntRxMessage, raw_fields: []const decoder.FieldData, allocator: std.mem.Allocator) !void {
        msg.* = .{};
        for (raw_fields) |rf| {
            switch (rf.id) {
                253 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.timestamp = rf.raw_value.scalar.uint32;
                },
                0 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint16);
                    msg.*.fractional_timestamp = (f / 32768) - 0;
                },
                1 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .byte);
                    msg.*.mesg_id = rf.raw_value.scalar.byte;
                },
                2 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .byte);
                    msg.*.mesg_data = try allocator.alloc(u8, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        msg.*.mesg_data[i] = raw_value.byte;
                    }
                },
                3 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.channel_number = rf.raw_value.scalar.uint8;
                },
                4 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .byte);
                    msg.*.data = try allocator.alloc(u8, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        msg.*.data[i] = raw_value.byte;
                    }
                },
                else => {},
            }
        }
    }

    pub fn deinit(msg: AntRxMessage, allocator: std.mem.Allocator) void {
        if (msg.mesg_data != null and msg.mesg_data.?.len > 0) {
            allocator.free(msg.mesg_data.?);
        }
        if (msg.data != null and msg.data.?.len > 0) {
            allocator.free(msg.data.?);
        }
    }
};

pub const AntTxMessage = struct {
    timestamp: ?u32 = null,
    fractional_timestamp: ?f32 = null,
    mesg_id: ?u8 = null,
    mesg_data: ?[]u8 = null,
    channel_number: ?u8 = null,
    data: ?[]u8 = null,

    pub fn fromRawFields(msg: *AntTxMessage, raw_fields: []const decoder.FieldData, allocator: std.mem.Allocator) !void {
        msg.* = .{};
        for (raw_fields) |rf| {
            switch (rf.id) {
                253 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.timestamp = rf.raw_value.scalar.uint32;
                },
                0 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint16);
                    msg.*.fractional_timestamp = (f / 32768) - 0;
                },
                1 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .byte);
                    msg.*.mesg_id = rf.raw_value.scalar.byte;
                },
                2 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .byte);
                    msg.*.mesg_data = try allocator.alloc(u8, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        msg.*.mesg_data[i] = raw_value.byte;
                    }
                },
                3 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.channel_number = rf.raw_value.scalar.uint8;
                },
                4 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .byte);
                    msg.*.data = try allocator.alloc(u8, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        msg.*.data[i] = raw_value.byte;
                    }
                },
                else => {},
            }
        }
    }

    pub fn deinit(msg: AntTxMessage, allocator: std.mem.Allocator) void {
        if (msg.mesg_data != null and msg.mesg_data.?.len > 0) {
            allocator.free(msg.mesg_data.?);
        }
        if (msg.data != null and msg.data.?.len > 0) {
            allocator.free(msg.data.?);
        }
    }
};

pub const ExdScreenConfigurationMessage = struct {
    screen_index: ?u8 = null,
    /// number of fields in screen
    field_count: ?u8 = null,
    layout: ?ExdLayout = null,
    screen_enabled: ?bool = null,

    pub fn fromRawFields(msg: *ExdScreenConfigurationMessage, raw_fields: []const decoder.FieldData) !void {
        msg.* = .{};
        for (raw_fields) |rf| {
            switch (rf.id) {
                0 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.screen_index = rf.raw_value.scalar.uint8;
                },
                1 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.field_count = rf.raw_value.scalar.uint8;
                },
                2 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.layout = @enumFromInt(rf.raw_value.scalar.enumeration);
                },
                else => {},
            }
        }
    }
};

pub const ExdDataFieldConfigurationMessage = struct {
    screen_index: ?u8 = null,
    concept_field: ?u8 = null,
    field_id: ?u8 = null,
    concept_count: ?u8 = null,
    display_type: ?ExdDisplayType = null,
    title: ?[:0]u8 = null,

    pub fn fromRawFields(msg: *ExdDataFieldConfigurationMessage, raw_fields: []const decoder.FieldData, allocator: std.mem.Allocator) !void {
        msg.* = .{};
        for (raw_fields) |rf| {
            switch (rf.id) {
                0 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.screen_index = rf.raw_value.scalar.uint8;
                },
                1 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .byte);
                    msg.*.concept_field = rf.raw_value.scalar.byte;
                },
                2 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.field_id = rf.raw_value.scalar.uint8;
                },
                3 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.concept_count = rf.raw_value.scalar.uint8;
                },
                4 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.display_type = @enumFromInt(rf.raw_value.scalar.enumeration);
                },
                5 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .string);
                    msg.*.title = try allocator.alloc([:0]u8, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        msg.*.title[i] = raw_value.string;
                    }
                },
                else => {},
            }
        }
    }

    pub fn deinit(msg: ExdDataFieldConfigurationMessage, allocator: std.mem.Allocator) void {
        if (msg.title != null and msg.title.?.len > 0) {
            allocator.free(msg.title.?);
        }
    }
};

pub const ExdDataConceptConfigurationMessage = struct {
    screen_index: ?u8 = null,
    concept_field: ?u8 = null,
    field_id: ?u8 = null,
    concept_index: ?u8 = null,
    data_page: ?u8 = null,
    concept_key: ?u8 = null,
    scaling: ?u8 = null,
    data_units: ?ExdDataUnits = null,
    qualifier: ?ExdQualifiers = null,
    descriptor: ?ExdDescriptors = null,
    is_signed: ?bool = null,

    pub fn fromRawFields(msg: *ExdDataConceptConfigurationMessage, raw_fields: []const decoder.FieldData) !void {
        msg.* = .{};
        for (raw_fields) |rf| {
            switch (rf.id) {
                0 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.screen_index = rf.raw_value.scalar.uint8;
                },
                1 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .byte);
                    msg.*.concept_field = rf.raw_value.scalar.byte;
                },
                2 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.field_id = rf.raw_value.scalar.uint8;
                },
                3 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.concept_index = rf.raw_value.scalar.uint8;
                },
                4 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.data_page = rf.raw_value.scalar.uint8;
                },
                5 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.concept_key = rf.raw_value.scalar.uint8;
                },
                6 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.scaling = rf.raw_value.scalar.uint8;
                },
                8 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.data_units = @enumFromInt(rf.raw_value.scalar.enumeration);
                },
                9 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.qualifier = @enumFromInt(rf.raw_value.scalar.enumeration);
                },
                10 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.descriptor = @enumFromInt(rf.raw_value.scalar.enumeration);
                },
                else => {},
            }
        }
    }
};

pub const DiveSummaryMessage = struct {
    timestamp: ?u32 = null,
    reference_mesg: ?MesgNum = null,
    reference_index: ?MessageIndex = null,
    /// 0 if above water
    avg_depth: ?f32 = null,
    /// 0 if above water
    max_depth: ?f32 = null,
    /// Time since end of last dive
    surface_interval: ?f32 = null,
    start_cns: ?f32 = null,
    end_cns: ?f32 = null,
    start_n2: ?f32 = null,
    end_n2: ?f32 = null,
    o2_toxicity: ?u16 = null,
    dive_number: ?u32 = null,
    bottom_time: ?f32 = null,
    /// Average pressure-based surface air consumption
    avg_pressure_sac: ?f32 = null,
    /// Average volumetric surface air consumption
    avg_volume_sac: ?f32 = null,
    /// Average respiratory minute volume
    avg_rmv: ?f32 = null,
    /// Time to reach deepest level stop
    descent_time: ?f32 = null,
    /// Time after leaving bottom until reaching surface
    ascent_time: ?f32 = null,
    /// Average ascent rate, not including descents or stops
    avg_ascent_rate: ?f32 = null,
    /// Average descent rate, not including ascents or stops
    avg_descent_rate: ?f32 = null,
    /// Maximum ascent rate
    max_ascent_rate: ?f32 = null,
    /// Maximum descent rate
    max_descent_rate: ?f32 = null,
    /// Time spent neither ascending nor descending
    hang_time: ?f32 = null,

    pub fn fromRawFields(msg: *DiveSummaryMessage, raw_fields: []const decoder.FieldData) !void {
        msg.* = .{};
        for (raw_fields) |rf| {
            switch (rf.id) {
                253 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.timestamp = rf.raw_value.scalar.uint32;
                },
                0 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.reference_mesg = @enumFromInt(rf.raw_value.scalar.uint16);
                },
                1 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.reference_index = @enumFromInt(rf.raw_value.scalar.uint16);
                },
                2 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint32);
                    msg.*.avg_depth = (f / 1000) - 0;
                },
                3 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint32);
                    msg.*.max_depth = (f / 1000) - 0;
                },
                4 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint32);
                    msg.*.surface_interval = (f / 1) - 0;
                },
                5 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint8);
                    msg.*.start_cns = (f / 1) - 0;
                },
                6 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint8);
                    msg.*.end_cns = (f / 1) - 0;
                },
                7 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint16);
                    msg.*.start_n2 = (f / 1) - 0;
                },
                8 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint16);
                    msg.*.end_n2 = (f / 1) - 0;
                },
                9 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.o2_toxicity = rf.raw_value.scalar.uint16;
                },
                10 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.dive_number = rf.raw_value.scalar.uint32;
                },
                11 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint32);
                    msg.*.bottom_time = (f / 1000) - 0;
                },
                12 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint16);
                    msg.*.avg_pressure_sac = (f / 100) - 0;
                },
                13 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint16);
                    msg.*.avg_volume_sac = (f / 100) - 0;
                },
                14 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint16);
                    msg.*.avg_rmv = (f / 100) - 0;
                },
                15 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint32);
                    msg.*.descent_time = (f / 1000) - 0;
                },
                16 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint32);
                    msg.*.ascent_time = (f / 1000) - 0;
                },
                17 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .sint32);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.sint32);
                    msg.*.avg_ascent_rate = (f / 1000) - 0;
                },
                22 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint32);
                    msg.*.avg_descent_rate = (f / 1000) - 0;
                },
                23 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint32);
                    msg.*.max_ascent_rate = (f / 1000) - 0;
                },
                24 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint32);
                    msg.*.max_descent_rate = (f / 1000) - 0;
                },
                25 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint32);
                    msg.*.hang_time = (f / 1000) - 0;
                },
                else => {},
            }
        }
    }
};

/// Number of acclerometer zero crossings summed over the specified time interval
pub const AadAccelFeaturesMessage = struct {
    timestamp: ?u32 = null,
    /// Time interval length in seconds
    time: ?u16 = null,
    /// Total accelerometer energy in the interval
    energy_total: ?u32 = null,
    /// Count of zero crossings
    zero_cross_cnt: ?u16 = null,
    /// Instance ID of zero crossing algorithm
    instance: ?u8 = null,
    /// Total accelerometer time above threshold in the interval
    time_above_threshold: ?f32 = null,

    pub fn fromRawFields(msg: *AadAccelFeaturesMessage, raw_fields: []const decoder.FieldData) !void {
        msg.* = .{};
        for (raw_fields) |rf| {
            switch (rf.id) {
                253 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.timestamp = rf.raw_value.scalar.uint32;
                },
                0 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.time = rf.raw_value.scalar.uint16;
                },
                1 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.energy_total = rf.raw_value.scalar.uint32;
                },
                2 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.zero_cross_cnt = rf.raw_value.scalar.uint16;
                },
                3 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.instance = rf.raw_value.scalar.uint8;
                },
                4 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint16);
                    msg.*.time_above_threshold = (f / 25) - 0;
                },
                else => {},
            }
        }
    }
};

/// Heart rate variability
pub const HrvMessage = struct {
    /// Time between beats
    time: ?[]f32 = null,

    pub fn fromRawFields(msg: *HrvMessage, raw_fields: []const decoder.FieldData, allocator: std.mem.Allocator) !void {
        msg.* = .{};
        for (raw_fields) |rf| {
            switch (rf.id) {
                0 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.time = try allocator.alloc(f32, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        const f: f32 = @floatFromInt(raw_value.uint16);
                        msg.*.time.?[i] = (f / 1000) - 0;
                    }
                },
                else => {},
            }
        }
    }

    pub fn deinit(msg: HrvMessage, allocator: std.mem.Allocator) void {
        if (msg.time != null and msg.time.?.len > 0) {
            allocator.free(msg.time.?);
        }
    }
};

/// Array of heart beat intervals
pub const BeatIntervalsMessage = struct {
    timestamp: ?u32 = null,
    /// Milliseconds past date_time
    timestamp_ms: ?u16 = null,
    /// Array of millisecond times between beats
    time: ?[]u16 = null,

    pub fn fromRawFields(msg: *BeatIntervalsMessage, raw_fields: []const decoder.FieldData, allocator: std.mem.Allocator) !void {
        msg.* = .{};
        for (raw_fields) |rf| {
            switch (rf.id) {
                253 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.timestamp = rf.raw_value.scalar.uint32;
                },
                0 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.timestamp_ms = rf.raw_value.scalar.uint16;
                },
                1 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.time = try allocator.alloc(u16, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        msg.*.time[i] = raw_value.uint16;
                    }
                },
                else => {},
            }
        }
    }

    pub fn deinit(msg: BeatIntervalsMessage, allocator: std.mem.Allocator) void {
        if (msg.time != null and msg.time.?.len > 0) {
            allocator.free(msg.time.?);
        }
    }
};

pub const HrvStatusSummaryMessage = struct {
    timestamp: ?u32 = null,
    /// 7 day RMSSD average over sleep
    weekly_average: ?f32 = null,
    /// Last night RMSSD average over sleep
    last_night_average: ?f32 = null,
    /// 5 minute high RMSSD value over sleep
    last_night_5_min_high: ?f32 = null,
    /// 3 week baseline, upper boundary of low HRV status
    baseline_low_upper: ?f32 = null,
    /// 3 week baseline, lower boundary of balanced HRV status
    baseline_balanced_lower: ?f32 = null,
    /// 3 week baseline, upper boundary of balanced HRV status
    baseline_balanced_upper: ?f32 = null,
    status: ?HrvStatus = null,

    pub fn fromRawFields(msg: *HrvStatusSummaryMessage, raw_fields: []const decoder.FieldData) !void {
        msg.* = .{};
        for (raw_fields) |rf| {
            switch (rf.id) {
                253 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.timestamp = rf.raw_value.scalar.uint32;
                },
                0 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint16);
                    msg.*.weekly_average = (f / 128) - 0;
                },
                1 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint16);
                    msg.*.last_night_average = (f / 128) - 0;
                },
                2 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint16);
                    msg.*.last_night_5_min_high = (f / 128) - 0;
                },
                3 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint16);
                    msg.*.baseline_low_upper = (f / 128) - 0;
                },
                4 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint16);
                    msg.*.baseline_balanced_lower = (f / 128) - 0;
                },
                5 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint16);
                    msg.*.baseline_balanced_upper = (f / 128) - 0;
                },
                6 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.status = @enumFromInt(rf.raw_value.scalar.enumeration);
                },
                else => {},
            }
        }
    }
};

pub const HrvValueMessage = struct {
    timestamp: ?u32 = null,
    /// 5 minute RMSSD
    value: ?f32 = null,

    pub fn fromRawFields(msg: *HrvValueMessage, raw_fields: []const decoder.FieldData) !void {
        msg.* = .{};
        for (raw_fields) |rf| {
            switch (rf.id) {
                253 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.timestamp = rf.raw_value.scalar.uint32;
                },
                0 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint16);
                    msg.*.value = (f / 128) - 0;
                },
                else => {},
            }
        }
    }
};

/// Raw Beat-to-Beat Interval values
pub const RawBbiMessage = struct {
    timestamp: ?u32 = null,
    /// Millisecond resolution of the timestamp
    timestamp_ms: ?u16 = null,
    /// 1 bit for gap indicator, 1 bit for quality indicator, and 14 bits for Beat-to-Beat interval values in whole-integer millisecond resolution
    data: ?[]u16 = null,
    /// Array of millisecond times between beats
    time: ?[]u16 = null,
    /// 1 = high confidence. 0 = low confidence. N/A when gap = 1
    quality: ?[]u8 = null,
    /// 1 = gap (time represents ms gap length). 0 = BBI data
    gap: ?[]u8 = null,

    pub fn fromRawFields(msg: *RawBbiMessage, raw_fields: []const decoder.FieldData, allocator: std.mem.Allocator) !void {
        msg.* = .{};
        for (raw_fields) |rf| {
            switch (rf.id) {
                253 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.timestamp = rf.raw_value.scalar.uint32;
                },
                0 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.timestamp_ms = rf.raw_value.scalar.uint16;
                },
                1 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.data = try allocator.alloc(u16, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        msg.*.data[i] = raw_value.uint16;
                    }
                },
                2 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.time = try allocator.alloc(u16, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        msg.*.time[i] = raw_value.uint16;
                    }
                },
                3 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.quality = try allocator.alloc(u8, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        msg.*.quality[i] = raw_value.uint8;
                    }
                },
                4 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.gap = try allocator.alloc(u8, rf.raw_value.array.len);
                    for (rf.raw_value.array, 0..) |raw_value, i| {
                        msg.*.gap[i] = raw_value.uint8;
                    }
                },
                else => {},
            }
        }
    }

    pub fn deinit(msg: RawBbiMessage, allocator: std.mem.Allocator) void {
        if (msg.data != null and msg.data.?.len > 0) {
            allocator.free(msg.data.?);
        }
        if (msg.time != null and msg.time.?.len > 0) {
            allocator.free(msg.time.?);
        }
        if (msg.quality != null and msg.quality.?.len > 0) {
            allocator.free(msg.quality.?);
        }
        if (msg.gap != null and msg.gap.?.len > 0) {
            allocator.free(msg.gap.?);
        }
    }
};

pub const RespirationRateMessage = struct {
    timestamp: ?u32 = null,
    /// Breaths * 100 /min, -300 indicates invalid, -200 indicates large motion, -100 indicates off wrist
    respiration_rate: ?f32 = null,

    pub fn fromRawFields(msg: *RespirationRateMessage, raw_fields: []const decoder.FieldData) !void {
        msg.* = .{};
        for (raw_fields) |rf| {
            switch (rf.id) {
                253 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.timestamp = rf.raw_value.scalar.uint32;
                },
                0 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .sint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.sint16);
                    msg.*.respiration_rate = (f / 100) - 0;
                },
                else => {},
            }
        }
    }
};

/// Specifically used for XERO products.
pub const ChronoShotSessionMessage = struct {
    timestamp: ?u32 = null,
    min_speed: ?f32 = null,
    max_speed: ?f32 = null,
    avg_speed: ?f32 = null,
    shot_count: ?u16 = null,
    projectile_type: ?ProjectileType = null,
    grain_weight: ?f32 = null,
    standard_deviation: ?f32 = null,

    pub fn fromRawFields(msg: *ChronoShotSessionMessage, raw_fields: []const decoder.FieldData) !void {
        msg.* = .{};
        for (raw_fields) |rf| {
            switch (rf.id) {
                253 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.timestamp = rf.raw_value.scalar.uint32;
                },
                0 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint32);
                    msg.*.min_speed = (f / 1000) - 0;
                },
                1 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint32);
                    msg.*.max_speed = (f / 1000) - 0;
                },
                2 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint32);
                    msg.*.avg_speed = (f / 1000) - 0;
                },
                3 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.shot_count = rf.raw_value.scalar.uint16;
                },
                4 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.projectile_type = @enumFromInt(rf.raw_value.scalar.enumeration);
                },
                5 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint32);
                    msg.*.grain_weight = (f / 10) - 0;
                },
                6 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint32);
                    msg.*.standard_deviation = (f / 1000) - 0;
                },
                else => {},
            }
        }
    }
};

/// Specifically used for XERO products.
pub const ChronoShotDataMessage = struct {
    timestamp: ?u32 = null,
    shot_speed: ?f32 = null,
    shot_num: ?u16 = null,

    pub fn fromRawFields(msg: *ChronoShotDataMessage, raw_fields: []const decoder.FieldData) !void {
        msg.* = .{};
        for (raw_fields) |rf| {
            switch (rf.id) {
                253 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.timestamp = rf.raw_value.scalar.uint32;
                },
                0 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint32);
                    msg.*.shot_speed = (f / 1000) - 0;
                },
                1 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.shot_num = rf.raw_value.scalar.uint16;
                },
                else => {},
            }
        }
    }
};

pub const TankUpdateMessage = struct {
    timestamp: ?u32 = null,
    sensor: ?AntChannelId = null,
    pressure: ?f32 = null,

    pub fn fromRawFields(msg: *TankUpdateMessage, raw_fields: []const decoder.FieldData) !void {
        msg.* = .{};
        for (raw_fields) |rf| {
            switch (rf.id) {
                253 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.timestamp = rf.raw_value.scalar.uint32;
                },
                0 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32z);
                    msg.*.sensor = @enumFromInt(rf.raw_value.scalar.uint32z);
                },
                1 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint16);
                    msg.*.pressure = (f / 100) - 0;
                },
                else => {},
            }
        }
    }
};

pub const TankSummaryMessage = struct {
    timestamp: ?u32 = null,
    sensor: ?AntChannelId = null,
    start_pressure: ?f32 = null,
    end_pressure: ?f32 = null,
    volume_used: ?f32 = null,

    pub fn fromRawFields(msg: *TankSummaryMessage, raw_fields: []const decoder.FieldData) !void {
        msg.* = .{};
        for (raw_fields) |rf| {
            switch (rf.id) {
                253 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.timestamp = rf.raw_value.scalar.uint32;
                },
                0 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32z);
                    msg.*.sensor = @enumFromInt(rf.raw_value.scalar.uint32z);
                },
                1 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint16);
                    msg.*.start_pressure = (f / 100) - 0;
                },
                2 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint16);
                    msg.*.end_pressure = (f / 100) - 0;
                },
                3 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint32);
                    msg.*.volume_used = (f / 100) - 0;
                },
                else => {},
            }
        }
    }
};

pub const SleepAssessmentMessage = struct {
    /// Average of awake_time_score and awakenings_count_score. If valid: 0 (worst) to 100 (best). If unknown: FIT_UINT8_INVALID.
    combined_awake_score: ?u8 = null,
    /// Score that evaluates the total time spent awake between sleep. If valid: 0 (worst) to 100 (best). If unknown: FIT_UINT8_INVALID.
    awake_time_score: ?u8 = null,
    /// Score that evaluates the number of awakenings that interrupt sleep. If valid: 0 (worst) to 100 (best). If unknown: FIT_UINT8_INVALID.
    awakenings_count_score: ?u8 = null,
    /// Score that evaluates the amount of deep sleep. If valid: 0 (worst) to 100 (best). If unknown: FIT_UINT8_INVALID.
    deep_sleep_score: ?u8 = null,
    /// Score that evaluates the quality of sleep based on sleep stages, heart-rate variability and possible awakenings during the night. If valid: 0 (worst) to 100 (best). If unknown: FIT_UINT8_INVALID.
    sleep_duration_score: ?u8 = null,
    /// Score that evaluates the amount of light sleep. If valid: 0 (worst) to 100 (best). If unknown: FIT_UINT8_INVALID.
    light_sleep_score: ?u8 = null,
    /// Total score that summarizes the overall quality of sleep, combining sleep duration and quality. If valid: 0 (worst) to 100 (best). If unknown: FIT_UINT8_INVALID.
    overall_sleep_score: ?u8 = null,
    /// Score that evaluates the quality of sleep based on sleep stages, heart-rate variability and possible awakenings during the night. If valid: 0 (worst) to 100 (best). If unknown: FIT_UINT8_INVALID.
    sleep_quality_score: ?u8 = null,
    /// Score that evaluates stress and recovery during sleep. If valid: 0 (worst) to 100 (best). If unknown: FIT_UINT8_INVALID.
    sleep_recovery_score: ?u8 = null,
    /// Score that evaluates the amount of REM sleep. If valid: 0 (worst) to 100 (best). If unknown: FIT_UINT8_INVALID.
    rem_sleep_score: ?u8 = null,
    /// Score that evaluates the amount of restlessness during sleep. If valid: 0 (worst) to 100 (best). If unknown: FIT_UINT8_INVALID.
    sleep_restlessness_score: ?u8 = null,
    /// The number of awakenings during sleep.
    awakenings_count: ?u8 = null,
    /// Score that evaluates the sleep interruptions. If valid: 0 (worst) to 100 (best). If unknown: FIT_UINT8_INVALID.
    interruptions_score: ?u8 = null,
    /// Excludes stress during awake periods in the sleep window
    average_stress_during_sleep: ?f32 = null,

    pub fn fromRawFields(msg: *SleepAssessmentMessage, raw_fields: []const decoder.FieldData) !void {
        msg.* = .{};
        for (raw_fields) |rf| {
            switch (rf.id) {
                0 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.combined_awake_score = rf.raw_value.scalar.uint8;
                },
                1 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.awake_time_score = rf.raw_value.scalar.uint8;
                },
                2 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.awakenings_count_score = rf.raw_value.scalar.uint8;
                },
                3 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.deep_sleep_score = rf.raw_value.scalar.uint8;
                },
                4 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.sleep_duration_score = rf.raw_value.scalar.uint8;
                },
                5 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.light_sleep_score = rf.raw_value.scalar.uint8;
                },
                6 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.overall_sleep_score = rf.raw_value.scalar.uint8;
                },
                7 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.sleep_quality_score = rf.raw_value.scalar.uint8;
                },
                8 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.sleep_recovery_score = rf.raw_value.scalar.uint8;
                },
                9 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.rem_sleep_score = rf.raw_value.scalar.uint8;
                },
                10 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.sleep_restlessness_score = rf.raw_value.scalar.uint8;
                },
                11 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.awakenings_count = rf.raw_value.scalar.uint8;
                },
                14 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint8);
                    msg.*.interruptions_score = rf.raw_value.scalar.uint8;
                },
                15 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    const f: f32 = @floatFromInt(rf.raw_value.scalar.uint16);
                    msg.*.average_stress_during_sleep = (f / 100) - 0;
                },
                else => {},
            }
        }
    }
};

pub const SleepDisruptionSeverityPeriodMessage = struct {
    message_index: ?MessageIndex = null,
    timestamp: ?u32 = null,
    severity: ?SleepDisruptionSeverity = null,

    pub fn fromRawFields(msg: *SleepDisruptionSeverityPeriodMessage, raw_fields: []const decoder.FieldData) !void {
        msg.* = .{};
        for (raw_fields) |rf| {
            switch (rf.id) {
                254 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.message_index = @enumFromInt(rf.raw_value.scalar.uint16);
                },
                253 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.timestamp = rf.raw_value.scalar.uint32;
                },
                0 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.severity = @enumFromInt(rf.raw_value.scalar.enumeration);
                },
                else => {},
            }
        }
    }
};

pub const SleepDisruptionOvernightSeverityMessage = struct {
    timestamp: ?u32 = null,
    severity: ?SleepDisruptionSeverity = null,

    pub fn fromRawFields(msg: *SleepDisruptionOvernightSeverityMessage, raw_fields: []const decoder.FieldData) !void {
        msg.* = .{};
        for (raw_fields) |rf| {
            switch (rf.id) {
                253 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.timestamp = rf.raw_value.scalar.uint32;
                },
                0 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.severity = @enumFromInt(rf.raw_value.scalar.enumeration);
                },
                else => {},
            }
        }
    }
};

pub const NapEventMessage = struct {
    message_index: ?MessageIndex = null,
    timestamp: ?u32 = null,
    start_time: ?u32 = null,
    start_timezone_offset: ?i16 = null,
    end_time: ?u32 = null,
    end_timezone_offset: ?i16 = null,
    feedback: ?NapPeriodFeedback = null,
    is_deleted: ?bool = null,
    source: ?NapSource = null,
    /// The timestamp representing when this nap event was last updated
    update_timestamp: ?u32 = null,

    pub fn fromRawFields(msg: *NapEventMessage, raw_fields: []const decoder.FieldData) !void {
        msg.* = .{};
        for (raw_fields) |rf| {
            switch (rf.id) {
                254 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint16);
                    msg.*.message_index = @enumFromInt(rf.raw_value.scalar.uint16);
                },
                253 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.timestamp = rf.raw_value.scalar.uint32;
                },
                0 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.start_time = rf.raw_value.scalar.uint32;
                },
                1 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .sint16);
                    msg.*.start_timezone_offset = rf.raw_value.scalar.sint16;
                },
                2 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.end_time = rf.raw_value.scalar.uint32;
                },
                3 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .sint16);
                    msg.*.end_timezone_offset = rf.raw_value.scalar.sint16;
                },
                4 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.feedback = @enumFromInt(rf.raw_value.scalar.enumeration);
                },
                6 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .enumeration);
                    msg.*.source = @enumFromInt(rf.raw_value.scalar.enumeration);
                },
                7 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.update_timestamp = rf.raw_value.scalar.uint32;
                },
                else => {},
            }
        }
    }
};

pub const SkinTempOvernightMessage = struct {
    timestamp: ?u32 = null,
    local_timestamp: ?u32 = null,
    /// The average overnight deviation from baseline temperature in degrees C
    average_deviation: ?f32 = null,
    /// The average 7 day overnight deviation from baseline temperature in degrees C
    average_7_day_deviation: ?f32 = null,
    /// Final overnight temperature value
    nightly_value: ?f32 = null,

    pub fn fromRawFields(msg: *SkinTempOvernightMessage, raw_fields: []const decoder.FieldData) !void {
        msg.* = .{};
        for (raw_fields) |rf| {
            switch (rf.id) {
                253 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.timestamp = rf.raw_value.scalar.uint32;
                },
                0 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .uint32);
                    msg.*.local_timestamp = rf.raw_value.scalar.uint32;
                },
                1 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .float32);
                    msg.*.average_deviation = rf.raw_value.scalar.float32;
                },
                2 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .float32);
                    msg.*.average_7_day_deviation = rf.raw_value.scalar.float32;
                },
                4 => {
                    assert(@as(decoder.FieldType, rf.raw_value.scalar) == .float32);
                    msg.*.nightly_value = rf.raw_value.scalar.float32;
                },
                else => {},
            }
        }
    }
};

const Message = union(MesgNum) {
    file_id: FileIdMessage,
    file_creator: FileCreatorMessage,
    timestamp_correlation: TimestampCorrelationMessage,
    software: SoftwareMessage,
    slave_device: SlaveDeviceMessage,
    capabilities: CapabilitiesMessage,
    file_capabilities: FileCapabilitiesMessage,
    mesg_capabilities: MesgCapabilitiesMessage,
    field_capabilities: FieldCapabilitiesMessage,
    device_settings: DeviceSettingsMessage,
    user_profile: UserProfileMessage,
    hrm_profile: HrmProfileMessage,
    sdm_profile: SdmProfileMessage,
    bike_profile: BikeProfileMessage,
    connectivity: ConnectivityMessage,
    watchface_settings: WatchfaceSettingsMessage,
    ohr_settings: OhrSettingsMessage,
    time_in_zone: TimeInZoneMessage,
    zones_target: ZonesTargetMessage,
    sport: SportMessage,
    hr_zone: HrZoneMessage,
    speed_zone: SpeedZoneMessage,
    cadence_zone: CadenceZoneMessage,
    power_zone: PowerZoneMessage,
    met_zone: MetZoneMessage,
    training_settings: TrainingSettingsMessage,
    dive_settings: DiveSettingsMessage,
    dive_alarm: DiveAlarmMessage,
    dive_apnea_alarm: DiveApneaAlarmMessage,
    dive_gas: DiveGasMessage,
    goal: GoalMessage,
    activity: ActivityMessage,
    session: SessionMessage,
    lap: LapMessage,
    length: LengthMessage,
    record: RecordMessage,
    event: EventMessage,
    device_info: DeviceInfoMessage,
    device_aux_battery_info: DeviceAuxBatteryInfoMessage,
    training_file: TrainingFileMessage,
    weather_conditions: WeatherConditionsMessage,
    weather_alert: WeatherAlertMessage,
    gps_metadata: GpsMetadataMessage,
    camera_event: CameraEventMessage,
    gyroscope_data: GyroscopeDataMessage,
    accelerometer_data: AccelerometerDataMessage,
    magnetometer_data: MagnetometerDataMessage,
    barometer_data: BarometerDataMessage,
    three_d_sensor_calibration: ThreeDSensorCalibrationMessage,
    one_d_sensor_calibration: OneDSensorCalibrationMessage,
    video_frame: VideoFrameMessage,
    obdii_data: ObdiiDataMessage,
    nmea_sentence: NmeaSentenceMessage,
    aviation_attitude: AviationAttitudeMessage,
    video: VideoMessage,
    video_title: VideoTitleMessage,
    video_description: VideoDescriptionMessage,
    video_clip: VideoClipMessage,
    set: SetMessage,
    jump: JumpMessage,
    split: SplitMessage,
    split_summary: SplitSummaryMessage,
    climb_pro: ClimbProMessage,
    field_description: FieldDescriptionMessage,
    developer_data_id: DeveloperDataIdMessage,
    course: CourseMessage,
    course_point: CoursePointMessage,
    segment_id: SegmentIdMessage,
    segment_leaderboard_entry: SegmentLeaderboardEntryMessage,
    segment_point: SegmentPointMessage,
    segment_lap: SegmentLapMessage,
    segment_file: SegmentFileMessage,
    workout: WorkoutMessage,
    workout_session: WorkoutSessionMessage,
    workout_step: WorkoutStepMessage,
    exercise_title: ExerciseTitleMessage,
    schedule: ScheduleMessage,
    totals: TotalsMessage,
    weight_scale: WeightScaleMessage,
    blood_pressure: BloodPressureMessage,
    monitoring_info: MonitoringInfoMessage,
    monitoring: MonitoringMessage,
    monitoring_hr_data: MonitoringHrDataMessage,
    spo2_data: Spo2DataMessage,
    hr: HrMessage,
    stress_level: StressLevelMessage,
    max_met_data: MaxMetDataMessage,
    hsa_body_battery_data: HsaBodyBatteryDataMessage,
    hsa_event: HsaEventMessage,
    hsa_accelerometer_data: HsaAccelerometerDataMessage,
    hsa_gyroscope_data: HsaGyroscopeDataMessage,
    hsa_step_data: HsaStepDataMessage,
    hsa_spo2_data: HsaSpo2DataMessage,
    hsa_stress_data: HsaStressDataMessage,
    hsa_respiration_data: HsaRespirationDataMessage,
    hsa_heart_rate_data: HsaHeartRateDataMessage,
    hsa_configuration_data: HsaConfigurationDataMessage,
    hsa_wrist_temperature_data: HsaWristTemperatureDataMessage,
    memo_glob: MemoGlobMessage,
    sleep_level: SleepLevelMessage,
    ant_channel_id: AntChannelIdMessage,
    ant_rx: AntRxMessage,
    ant_tx: AntTxMessage,
    exd_screen_configuration: ExdScreenConfigurationMessage,
    exd_data_field_configuration: ExdDataFieldConfigurationMessage,
    exd_data_concept_configuration: ExdDataConceptConfigurationMessage,
    dive_summary: DiveSummaryMessage,
    aad_accel_features: AadAccelFeaturesMessage,
    hrv: HrvMessage,
    beat_intervals: BeatIntervalsMessage,
    hrv_status_summary: HrvStatusSummaryMessage,
    hrv_value: HrvValueMessage,
    raw_bbi: RawBbiMessage,
    respiration_rate: RespirationRateMessage,
    chrono_shot_session: ChronoShotSessionMessage,
    chrono_shot_data: ChronoShotDataMessage,
    tank_update: TankUpdateMessage,
    tank_summary: TankSummaryMessage,
    sleep_assessment: SleepAssessmentMessage,
    sleep_disruption_severity_period: SleepDisruptionSeverityPeriodMessage,
    sleep_disruption_overnight_severity: SleepDisruptionOvernightSeverityMessage,
    nap_event: NapEventMessage,
    skin_temp_overnight: SkinTempOvernightMessage,
};

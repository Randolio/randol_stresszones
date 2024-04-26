return {
    EnableBlips = true,
    Timer = 10000, -- 10 seconds between each stress reduction whilst in the zone.
    Zones = {
        {
            blip = vec3(-1251.14, -1501.67, 4.6), 
            points = {
                vec3(-1233.73, -1513.49, 4.32),
                vec3(-1236.77, -1516.18, 4.32),
                vec3(-1276.81, -1507.12, 4.32),
                vec3(-1262.46, -1497.5, 4.32),
                vec3(-1256.8, -1494.64, 4.32),
                vec3(-1248.12, -1491.91, 4.32),
            }
        },
    },
    Animations = {
        {'amb@world_human_picnic@male@idle_a', 'idle_a'},
        {'amb@world_human_picnic@female@idle_a', 'idle_a'},
    },
    Scenarios = {
        'WORLD_HUMAN_YOGA',
    }
}
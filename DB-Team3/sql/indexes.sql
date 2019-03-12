-- INDEXES ON FOREIGN KEYS --

-- APPLICATION --
CREATE INDEX IDX_APPLICATION_FROM_EX_ORG ON APPLICATION (FROM_EX_ORG);
CREATE INDEX IDX_APPLICATION_CHECKED_BY ON APPLICATION (CHECKED_BY);

-- BAND --
CREATE INDEX IDX_BAND_RESPONSIBLE ON BAND (RESP_FOR_BAND);

-- FACILITY --
CREATE INDEX IDX_FACILITY_LOCATED_AT ON FACILITY (LOCATED_AT);

-- SHOP --
CREATE INDEX IDX_SHOP_DRIVEN_BY_ORGA ON SHOP (DRIVEN_BY_ORGA);
CREATE INDEX IDX_SHOP_DRIVEN_BY_SPONSOR ON SHOP (DRIVEN_BY_SPONSOR);

-- ITEM --
CREATE INDEX IDX_ITEM_SHOP_ID ON ITEM (SHOP);
CREATE INDEX IDX_ITEM_SUPPLIED_BY ON ITEM (SUPPLIED_BY);

-- TIMETABLE --
CREATE INDEX IDX_TIMETABLE_STAGE ON TIMETABLE (STAGE);
CREATE INDEX IDX_TIMETABLE_BAND ON TIMETABLE (BAND_ASSIGNED_TO);

-- TICKET_UNIT --
CREATE INDEX IDX_TICKET_UNIT_AREA ON TICKET_UNIT (AREA);

-- EMPLOYEE --
CREATE INDEX IDX_EMPLOYEE_PART_OF ON EMPLOYEE (PART_OF);

-- EXTERNAL --
CREATE INDEX IDX_EXTERNAL_WORKS_AT ON EXTERNAL (WORKS_AT);

-- NEWSLETTER --
CREATE INDEX IDX_NEWSLETTER_RELEASED_BY ON NEWSLETTER (RELEASED_BY);

-- SHIFT --
CREATE INDEX IDX_SHIFT_SHIFT_AT_FACILITY ON SHIFT (SHIFT_AT_FACILITY);

-- NOTIFICATION --
CREATE INDEX IDX_NOTIFICATION_LINKED_SHIFT ON NOTIFICATION (LINKED_SHIFT);
CREATE INDEX IDX_NOTIFICATION_EMITTED_BY_BAND ON NOTIFICATION (EMITTED_BY_BAND);
CREATE INDEX IDX_NOTIFICATION_EMITTED_BY_ORGA ON NOTIFICATION (EMITTED_BY_ORGA);
CREATE INDEX IDX_NOTIFICATION_HANDLED_BY ON NOTIFICATION (HANDLED_BY);

-- SPONSOR --
CREATE INDEX IDX_SPONSOR_RESP_FOR_SPONSOR ON SPONSOR (RESP_FOR_SPONSOR);

-- PRESS_INFORMATION --
CREATE INDEX IDX_PRESS_INFORMATION_WRITTEN_BY ON PRESS_INFORMATION (WRITTEN_BY);
CREATE INDEX IDX_PRESS_INFORMATION_RELEASED_BY ON PRESS_INFORMATION (RELEASED_BY);

-- AD_SPACE --
CREATE INDEX IDX_AD_SPACE_PLACED_BY_ORGA ON AD_SPACE (PLACED_BY_ORGA);
CREATE INDEX IDX_AD_SPACE_PLACED_BY_SPONSOR ON AD_SPACE (PLACED_BY_SPONSOR);

-- OTHER INDEXES --
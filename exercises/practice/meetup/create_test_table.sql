DROP TABLE IF EXISTS tests;
CREATE TABLE IF NOT EXISTS tests (
    -- uuid and name are taken from the test.toml file
    uuid TEXT PRIMARY KEY,
    name TEXT NOT NULL,
    -- The following section is needed by the online test-runner
    status TEXT DEFAULT 'fail',
    message TEXT,
    output TEXT,
    test_code TEXT,
    task_id INTEGER DEFAULT NULL,
    -- Here are columns for the actual tests
    year INT NOT NULL,
    month INT NOT NULL,
    week TEXT NOT NULL,
    dayofweek TEXT NOT NULL,
    expected TEXT NOT NULL
);

-- Note: the strings below contain literal tab, newline, carriage returns.

INSERT INTO tests (uuid, name, year, month, week, dayofweek, expected)
    VALUES
        ('d7f8eadd-d4fc-46ee-8a20-e97bd3fd01c8', 'when teenth Monday is the 13th, the first day of the teenth week', 2013, 5,'teenth', 'Monday', '2013-05-13'),
        ('f78373d1-cd53-4a7f-9d37-e15bf8a456b4', 'when teenth Monday is the 19th, the last day of the teenth week', 2013, 8,'teenth', 'Monday', '2013-08-19'),
        ('8c78bea7-a116-425b-9c6b-c9898266d92a', 'when teenth Monday is some day in the middle of the teenth week', 2013, 9,'teenth', 'Monday', '2013-09-16'),
        ('cfef881b-9dc9-4d0b-8de4-82d0f39fc271', 'when teenth Tuesday is the 19th, the last day of the teenth week', 2013, 3,'teenth', 'Tuesday', '2013-03-19'),
        ('69048961-3b00-41f9-97ee-eb6d83a8e92b', 'when teenth Tuesday is some day in the middle of the teenth week', 2013, 4,'teenth', 'Tuesday', '2013-04-16'),
        ('d30bade8-3622-466a-b7be-587414e0caa6', 'when teenth Tuesday is the 13th, the first day of the teenth week', 2013, 8,'teenth', 'Tuesday', '2013-08-13'),
        ('8db4b58b-92f3-4687-867b-82ee1a04f851', 'when teenth Wednesday is some day in the middle of the teenth week', 2013, 1,'teenth', 'Wednesday', '2013-01-16'),
        ('6c27a2a2-28f8-487f-ae81-35d08c4664f7', 'when teenth Wednesday is the 13th, the first day of the teenth week', 2013, 2,'teenth', 'Wednesday', '2013-02-13'),
        ('008a8674-1958-45b5-b8e6-c2c9960d973a', 'when teenth Wednesday is the 19th, the last day of the teenth week', 2013, 6,'teenth', 'Wednesday', '2013-06-19'),
        ('e4abd5e3-57cb-4091-8420-d97e955c0dbd', 'when teenth Thursday is some day in the middle of the teenth week', 2013, 5,'teenth', 'Thursday', '2013-05-16'),
        ('85da0b0f-eace-4297-a6dd-63588d5055b4', 'when teenth Thursday is the 13th, the first day of the teenth week', 2013, 6,'teenth', 'Thursday', '2013-06-13'),
        ('ecf64f9b-8413-489b-bf6e-128045f70bcc', 'when teenth Thursday is the 19th, the last day of the teenth week', 2013, 9,'teenth', 'Thursday', '2013-09-19'),
        ('ac4e180c-7d0a-4d3d-b05f-f564ebb584ca', 'when teenth Friday is the 19th, the last day of the teenth week', 2013, 4,'teenth', 'Friday', '2013-04-19'),
        ('b79101c7-83ad-4f8f-8ec8-591683296315', 'when teenth Friday is some day in the middle of the teenth week', 2013, 8,'teenth', 'Friday', '2013-08-16'),
        ('6ed38b9f-0072-4901-bd97-7c8b8b0ef1b8', 'when teenth Friday is the 13th, the first day of the teenth week', 2013, 9,'teenth', 'Friday', '2013-09-13'),
        ('dfae03ed-9610-47de-a632-655ab01e1e7c', 'when teenth Saturday is some day in the middle of the teenth week', 2013, 2,'teenth', 'Saturday', '2013-02-16'),
        ('ec02e3e1-fc72-4a3c-872f-a53fa8ab358e', 'when teenth Saturday is the 13th, the first day of the teenth week', 2013, 4,'teenth', 'Saturday', '2013-04-13'),
        ('d983094b-7259-4195-b84e-5d09578c89d9', 'when teenth Saturday is the 19th, the last day of the teenth week', 2013, 10,'teenth', 'Saturday', '2013-10-19'),
        ('d84a2a2e-f745-443a-9368-30051be60c2e', 'when teenth Sunday is the 19th, the last day of the teenth week', 2013, 5,'teenth', 'Sunday', '2013-05-19'),
        ('0e64bc53-92a3-4f61-85b2-0b7168c7ce5a', 'when teenth Sunday is some day in the middle of the teenth week', 2013, 6,'teenth', 'Sunday', '2013-06-16'),
        ('de87652c-185e-4854-b3ae-04cf6150eead', 'when teenth Sunday is the 13th, the first day of the teenth week', 2013, 10,'teenth', 'Sunday', '2013-10-13'),
        ('2cbfd0f5-ba3a-46da-a8cc-0fe4966d3411', 'when first Monday is some day in the middle of the first week', 2013, 3,'first', 'Monday', '2013-03-04'),
        ('a6168c7c-ed95-4bb3-8f92-c72575fc64b0', 'when first Monday is the 1st, the first day of the first week', 2013, 4,'first', 'Monday', '2013-04-01'),
        ('1bfc620f-1c54-4bbd-931f-4a1cd1036c20', 'when first Tuesday is the 7th, the last day of the first week', 2013, 5,'first', 'Tuesday', '2013-05-07'),
        ('12959c10-7362-4ca0-a048-50cf1c06e3e2', 'when first Tuesday is some day in the middle of the first week', 2013, 6,'first', 'Tuesday', '2013-06-04'),
        ('1033dc66-8d0b-48a1-90cb-270703d59d1d', 'when first Wednesday is some day in the middle of the first week', 2013, 7,'first', 'Wednesday', '2013-07-03'),
        ('b89185b9-2f32-46f4-a602-de20b09058f6', 'when first Wednesday is the 7th, the last day of the first week', 2013, 8,'first', 'Wednesday', '2013-08-07'),
        ('53aedc4d-b2c8-4dfb-abf7-a8dc9cdceed5', 'when first Thursday is some day in the middle of the first week', 2013, 9,'first', 'Thursday', '2013-09-05'),
        ('b420a7e3-a94c-4226-870a-9eb3a92647f0', 'when first Thursday is another day in the middle of the first week', 2013, 10,'first', 'Thursday', '2013-10-03'),
        ('61df3270-28b4-4713-bee2-566fa27302ca', 'when first Friday is the 1st, the first day of the first week', 2013, 11,'first', 'Friday', '2013-11-01'),
        ('cad33d4d-595c-412f-85cf-3874c6e07abf', 'when first Friday is some day in the middle of the first week', 2013, 12,'first', 'Friday', '2013-12-06'),
        ('a2869b52-5bba-44f0-a863-07bd1f67eadb', 'when first Saturday is some day in the middle of the first week', 2013, 1,'first', 'Saturday', '2013-01-05'),
        ('3585315a-d0db-4ea1-822e-0f22e2a645f5', 'when first Saturday is another day in the middle of the first week', 2013, 2,'first', 'Saturday', '2013-02-02'),
        ('c49e9bd9-8ccf-4cf2-947a-0ccd4e4f10b1', 'when first Sunday is some day in the middle of the first week', 2013, 3,'first', 'Sunday', '2013-03-03'),
        ('1513328b-df53-4714-8677-df68c4f9366c', 'when first Sunday is the 7th, the last day of the first week', 2013, 4,'first', 'Sunday', '2013-04-07'),
        ('49e083af-47ec-4018-b807-62ef411efed7', 'when second Monday is some day in the middle of the second week', 2013, 3,'second', 'Monday', '2013-03-11'),
        ('6cb79a73-38fe-4475-9101-9eec36cf79e5', 'when second Monday is the 8th, the first day of the second week', 2013, 4,'second', 'Monday', '2013-04-08'),
        ('4c39b594-af7e-4445-aa03-bf4f8effd9a1', 'when second Tuesday is the 14th, the last day of the second week', 2013, 5,'second', 'Tuesday', '2013-05-14'),
        ('41b32c34-2e39-40e3-b790-93539aaeb6dd', 'when second Tuesday is some day in the middle of the second week', 2013, 6,'second', 'Tuesday', '2013-06-11'),
        ('90a160c5-b5d9-4831-927f-63a78b17843d', 'when second Wednesday is some day in the middle of the second week', 2013, 7,'second', 'Wednesday', '2013-07-10'),
        ('23b98ce7-8dd5-41a1-9310-ef27209741cb', 'when second Wednesday is the 14th, the last day of the second week', 2013, 8,'second', 'Wednesday', '2013-08-14'),
        ('447f1960-27ca-4729-bc3f-f36043f43ed0', 'when second Thursday is some day in the middle of the second week', 2013, 9,'second', 'Thursday', '2013-09-12'),
        ('c9aa2687-300c-4e79-86ca-077849a81bde', 'when second Thursday is another day in the middle of the second week', 2013, 10,'second', 'Thursday', '2013-10-10'),
        ('a7e11ef3-6625-4134-acda-3e7195421c09', 'when second Friday is the 8th, the first day of the second week', 2013, 11,'second', 'Friday', '2013-11-08'),
        ('8b420e5f-9290-4106-b5ae-022f3e2a3e41', 'when second Friday is some day in the middle of the second week', 2013, 12,'second', 'Friday', '2013-12-13'),
        ('80631afc-fc11-4546-8b5f-c12aaeb72b4f', 'when second Saturday is some day in the middle of the second week', 2013, 1,'second', 'Saturday', '2013-01-12'),
        ('e34d43ac-f470-44c2-aa5f-e97b78ecaf83', 'when second Saturday is another day in the middle of the second week', 2013, 2,'second', 'Saturday', '2013-02-09'),
        ('a57d59fd-1023-47ad-b0df-a6feb21b44fc', 'when second Sunday is some day in the middle of the second week', 2013, 3,'second', 'Sunday', '2013-03-10'),
        ('a829a8b0-abdd-4ad1-b66c-5560d843c91a', 'when second Sunday is the 14th, the last day of the second week', 2013, 4,'second', 'Sunday', '2013-04-14'),
        ('501a8a77-6038-4fc0-b74c-33634906c29d', 'when third Monday is some day in the middle of the third week', 2013, 3,'third', 'Monday', '2013-03-18'),
        ('49e4516e-cf32-4a58-8bbc-494b7e851c92', 'when third Monday is the 15th, the first day of the third week', 2013, 4,'third', 'Monday', '2013-04-15'),
        ('4db61095-f7c7-493c-85f1-9996ad3012c7', 'when third Tuesday is the 21st, the last day of the third week', 2013, 5,'third', 'Tuesday', '2013-05-21'),
        ('714fc2e3-58d0-4b91-90fd-61eefd2892c0', 'when third Tuesday is some day in the middle of the third week', 2013, 6,'third', 'Tuesday', '2013-06-18'),
        ('b08a051a-2c80-445b-9b0e-524171a166d1', 'when third Wednesday is some day in the middle of the third week', 2013, 7,'third', 'Wednesday', '2013-07-17'),
        ('80bb9eff-3905-4c61-8dc9-bb03016d8ff8', 'when third Wednesday is the 21st, the last day of the third week', 2013, 8,'third', 'Wednesday', '2013-08-21'),
        ('fa52a299-f77f-4784-b290-ba9189fbd9c9', 'when third Thursday is some day in the middle of the third week', 2013, 9,'third', 'Thursday', '2013-09-19'),
        ('f74b1bc6-cc5c-4bf1-ba69-c554a969eb38', 'when third Thursday is another day in the middle of the third week', 2013, 10,'third', 'Thursday', '2013-10-17'),
        ('8900f3b0-801a-466b-a866-f42d64667abd', 'when third Friday is the 15th, the first day of the third week', 2013, 11,'third', 'Friday', '2013-11-15'),
        ('538ac405-a091-4314-9ccd-920c4e38e85e', 'when third Friday is some day in the middle of the third week', 2013, 12,'third', 'Friday', '2013-12-20'),
        ('244db35c-2716-4fa0-88ce-afd58e5cf910', 'when third Saturday is some day in the middle of the third week', 2013, 1,'third', 'Saturday', '2013-01-19'),
        ('dd28544f-f8fa-4f06-9bcd-0ad46ce68e9e', 'when third Saturday is another day in the middle of the third week', 2013, 2,'third', 'Saturday', '2013-02-16'),
        ('be71dcc6-00d2-4b53-a369-cbfae55b312f', 'when third Sunday is some day in the middle of the third week', 2013, 3,'third', 'Sunday', '2013-03-17'),
        ('b7d2da84-4290-4ee6-a618-ee124ae78be7', 'when third Sunday is the 21st, the last day of the third week', 2013, 4,'third', 'Sunday', '2013-04-21'),
        ('4276dc06-a1bd-4fc2-b6c2-625fee90bc88', 'when fourth Monday is some day in the middle of the fourth week', 2013, 3,'fourth', 'Monday', '2013-03-25'),
        ('ddbd7976-2deb-4250-8a38-925ac1a8e9a2', 'when fourth Monday is the 22nd, the first day of the fourth week', 2013, 4,'fourth', 'Monday', '2013-04-22'),
        ('eb714ef4-1656-47cc-913c-844dba4ebddd', 'when fourth Tuesday is the 28th, the last day of the fourth week', 2013, 5,'fourth', 'Tuesday', '2013-05-28'),
        ('16648435-7937-4d2d-b118-c3e38fd084bd', 'when fourth Tuesday is some day in the middle of the fourth week', 2013, 6,'fourth', 'Tuesday', '2013-06-25'),
        ('de062bdc-9484-437a-a8c5-5253c6f6785a', 'when fourth Wednesday is some day in the middle of the fourth week', 2013, 7,'fourth', 'Wednesday', '2013-07-24'),
        ('c2ce6821-169c-4832-8d37-690ef5d9514a', 'when fourth Wednesday is the 28th, the last day of the fourth week', 2013, 8,'fourth', 'Wednesday', '2013-08-28'),
        ('d462c631-2894-4391-a8e3-dbb98b7a7303', 'when fourth Thursday is some day in the middle of the fourth week', 2013, 9,'fourth', 'Thursday', '2013-09-26'),
        ('9ff1f7b6-1b72-427d-9ee9-82b5bb08b835', 'when fourth Thursday is another day in the middle of the fourth week', 2013, 10,'fourth', 'Thursday', '2013-10-24'),
        ('83bae8ba-1c49-49bc-b632-b7c7e1d7e35f', 'when fourth Friday is the 22nd, the first day of the fourth week', 2013, 11,'fourth', 'Friday', '2013-11-22'),
        ('de752d2a-a95e-48d2-835b-93363dac3710', 'when fourth Friday is some day in the middle of the fourth week', 2013, 12,'fourth', 'Friday', '2013-12-27'),
        ('eedd90ad-d581-45db-8312-4c6dcf9cf560', 'when fourth Saturday is some day in the middle of the fourth week', 2013, 1,'fourth', 'Saturday', '2013-01-26'),
        ('669fedcd-912e-48c7-a0a1-228b34af91d0', 'when fourth Saturday is another day in the middle of the fourth week', 2013, 2,'fourth', 'Saturday', '2013-02-23'),
        ('648e3849-ea49-44a5-a8a3-9f2a43b3bf1b', 'when fourth Sunday is some day in the middle of the fourth week', 2013, 3,'fourth', 'Sunday', '2013-03-24'),
        ('f81321b3-99ab-4db6-9267-69c5da5a7823', 'when fourth Sunday is the 28th, the last day of the fourth week', 2013, 4,'fourth', 'Sunday', '2013-04-28'),
        ('1af5e51f-5488-4548-aee8-11d7d4a730dc', 'last Monday in a month with four Mondays', 2013, 3,'last', 'Monday', '2013-03-25'),
        ('f29999f2-235e-4ec7-9dab-26f137146526', 'last Monday in a month with five Mondays', 2013, 4,'last', 'Monday', '2013-04-29'),
        ('31b097a0-508e-48ac-bf8a-f63cdcf6dc41', 'last Tuesday in a month with four Tuesdays', 2013, 5,'last', 'Tuesday', '2013-05-28'),
        ('8c022150-0bb5-4a1f-80f9-88b2e2abcba4', 'last Tuesday in another month with four Tuesdays', 2013, 6,'last', 'Tuesday', '2013-06-25'),
        ('0e762194-672a-4bdf-8a37-1e59fdacef12', 'last Wednesday in a month with five Wednesdays', 2013, 7,'last', 'Wednesday', '2013-07-31'),
        ('5016386a-f24e-4bd7-b439-95358f491b66', 'last Wednesday in a month with four Wednesdays', 2013, 8,'last', 'Wednesday', '2013-08-28'),
        ('12ead1a5-cdf9-4192-9a56-2229e93dd149', 'last Thursday in a month with four Thursdays', 2013, 9,'last', 'Thursday', '2013-09-26'),
        ('7db89e11-7fbe-4e57-ae3c-0f327fbd7cc7', 'last Thursday in a month with five Thursdays', 2013, 10,'last', 'Thursday', '2013-10-31'),
        ('e47a739e-b979-460d-9c8a-75c35ca2290b', 'last Friday in a month with five Fridays', 2013, 11,'last', 'Friday', '2013-11-29'),
        ('5bed5aa9-a57a-4e5d-8997-2cc796a5b0ec', 'last Friday in a month with four Fridays', 2013, 12,'last', 'Friday', '2013-12-27'),
        ('61e54cba-76f3-4772-a2b1-bf443fda2137', 'last Saturday in a month with four Saturdays', 2013, 1,'last', 'Saturday', '2013-01-26'),
        ('8b6a737b-2fa9-444c-b1a2-80ce7a2ec72f', 'last Saturday in another month with four Saturdays', 2013, 2,'last', 'Saturday', '2013-02-23'),
        ('0b63e682-f429-4d19-9809-4a45bd0242dc', 'last Sunday in a month with five Sundays', 2013, 3,'last', 'Sunday', '2013-03-31'),
        ('5232307e-d3e3-4afc-8ba6-4084ad987c00', 'last Sunday in a month with four Sundays', 2013, 4,'last', 'Sunday', '2013-04-28'),
        ('0bbd48e8-9773-4e81-8e71-b9a51711e3c5', 'when last Wednesday in February in a leap year is the 29th', 2012, 2, 'last', 'Wednesday', '2012-02-29'),
        ('fe0936de-7eee-4a48-88dd-66c07ab1fefc', 'last Wednesday in December that is also the last day of the year', 2014, 12, 'last', 'Wednesday', '2014-12-31'),
        ('2ccf2488-aafc-4671-a24e-2b6effe1b0e2', 'when last Sunday in February in a non-leap year is not the 29th', 2015, 2, 'last', 'Sunday', '2015-02-22'),
        ('00c3ce9f-cf36-4b70-90d8-92b32be6830e', 'when first Friday is the 7th, the last day of the first week', 2012, 12, 'first', 'Friday', '2012-12-07');

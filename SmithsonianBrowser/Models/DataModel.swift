//
//  DataModel.swift
//  SmithsonianBrowser
//
//  Created by Jeff Handy on 5/11/21.
//

import Foundation

//api-key: mRY92ymJq7RNs3yVqwWroToBhnZXucAb6OKymy8N


/* test search */

//https://api.si.edu/openaccess/api/v1.0/search?api_key=mRY92ymJq7RNs3yVqwWroToBhnZXucAb6OKymy8N&q=test

//category search

//https://api.si.edu/openaccess/api/v1.0/category/:cat/search
//https://api.si.edu/openaccess/api/v1.0/category/science_technology/search?api_key=mRY92ymJq7RNs3yVqwWroToBhnZXucAb6OKymy8N&q=test

/*
 q     String

 the query you would like to issue. query field accepts boolean operators [AND|OR] as well as fielded searches [topic:Gastropoda]. See terms for more field types.
 start optional     int

 the start row of your query

 Default value: 0
 rows optional     int

 size of array to be returned.

 Default value: 10

 Size range: 0..1000
 api_key     String

 the API KEY you received from https://api.data.gov/signup/
 :cat     String

 the category you are filtering against..

 Allowed values: art_design, history_culture, science_technology
 */


// content retrieval

// id: edanmdm-nmaahc_2012.36.4ab


//API call:  https://api.si.edu/openaccess/api/v1.0/content/:id

//example: https://api.si.edu/openaccess/api/v1.0/content/edanmdm-nmaahc_2012.36.4ab?api_key=mRY92ymJq7RNs3yVqwWroToBhnZXucAb6OKymy8N
/*{
    "status": 200,
    "responseCode": 1,
    "response": {
        "id": "edanmdm-nmaahc_2012.36.4ab",
        "title": "Drumsticks used by Art Blakey",
        "unitCode": "NMAAHC",
        "type": "edanmdm",
        "url": "edanmdm:nmaahc_2012.36.4ab",
        "content": {
            "descriptiveNonRepeating": {
                "record_ID": "nmaahc_2012.36.4ab",
                "online_media": {
                    "mediaCount": 2,
                    "media": [
                        {
                            "thumbnail": "https://ids.si.edu/ids/deliveryService?id=NMAAHC-2012_36_4ab_001-000001",
                            "idsId": "NMAAHC-2012_36_4ab_001-000001",
                            "usage": {
                                "access": "CC0"
                            },
                            "guid": "http://n2t.net/ark:/65665/az9cfd20077-17c2-4d9c-af0d-807fc468b451",
                            "type": "Images",
                            "content": "https://ids.si.edu/ids/deliveryService?id=NMAAHC-2012_36_4ab_001-000001",
                            "resources": [
                                {
                                    "label": "High-resolution TIFF",
                                    "url": "https://ids.si.edu/ids/download?id=NMAAHC-2012_36_4ab_001-000001.tif"
                                },
                                {
                                    "label": "High-resolution JPEG (7033x1885)",
                                    "url": "https://ids.si.edu/ids/download?id=NMAAHC-2012_36_4ab_001-000001.jpg"
                                },
                                {
                                    "label": "Screen Image",
                                    "url": "https://ids.si.edu/ids/download?id=NMAAHC-2012_36_4ab_001-000001_screen"
                                },
                                {
                                    "label": "Thumbnail Image",
                                    "url": "https://ids.si.edu/ids/download?id=NMAAHC-2012_36_4ab_001-000001_thumb"
                                }
                            ]
                        },
                        {
                            "thumbnail": "https://ids.si.edu/ids/deliveryService?id=NMAAHC-2012_36_4ab_002-000001",
                            "idsId": "NMAAHC-2012_36_4ab_002-000001",
                            "usage": {
                                "access": "CC0"
                            },
                            "guid": "http://n2t.net/ark:/65665/az9cad988ac-2d2d-4f7b-85f6-bf7c89368486",
                            "type": "Images",
                            "content": "https://ids.si.edu/ids/deliveryService?id=NMAAHC-2012_36_4ab_002-000001",
                            "resources": [
                                {
                                    "label": "High-resolution TIFF",
                                    "url": "https://ids.si.edu/ids/download?id=NMAAHC-2012_36_4ab_002-000001.tif"
                                },
                                {
                                    "label": "High-resolution JPEG (5836x1738)",
                                    "url": "https://ids.si.edu/ids/download?id=NMAAHC-2012_36_4ab_002-000001.jpg"
                                },
                                {
                                    "label": "Screen Image",
                                    "url": "https://ids.si.edu/ids/download?id=NMAAHC-2012_36_4ab_002-000001_screen"
                                },
                                {
                                    "label": "Thumbnail Image",
                                    "url": "https://ids.si.edu/ids/download?id=NMAAHC-2012_36_4ab_002-000001_thumb"
                                }
                            ]
                        }
                    ]
                },
                "unit_code": "NMAAHC",
                "title_sort": "DRUMSTICKS USED BY ART BLAKEY",
                "guid": "http://n2t.net/ark:/65665/fd5665b0e78-9453-4089-863f-781e34ac34bf",
                "record_link": "https://nmaahc.si.edu/object/nmaahc_2012.36.4ab",
                "title": {
                    "label": "Object Name",
                    "content": "Drumsticks used by Art Blakey"
                },
                "metadata_usage": {
                    "access": "CC0"
                },
                "data_source": "National Museum of African American History and Culture"
            },
            "indexedStructured": {
                "date": [
                    "1980s"
                ],
                "geoLocation": [
                    {
                        "L2": {
                            "type": "Country",
                            "content": "United States"
                        }
                    },
                    {
                        "L1": {
                            "type": "Continent",
                            "content": "North and Central America"
                        }
                    }
                ],
                "object_type": [
                    "Drumsticks"
                ],
                "culture": [
                    "African Americans"
                ],
                "online_media_rights": [
                    "No Known Copyright Restrictions"
                ],
                "name": [
                    "Vic Firth Company",
                    "Blakey, Art"
                ],
                "topic": [
                    "Instrumentalists (Musicians)",
                    "Jazz (Music)"
                ],
                "place": [
                    "United States",
                    "North and Central America"
                ],
                "online_media_type": [
                    "Images"
                ]
            },
            "freetext": {
                "setName": [
                    {
                        "label": "See more items in",
                        "content": "National Museum of African American History and Culture Collection"
                    },
                    {
                        "label": "Classification",
                        "content": "Musical Instruments"
                    }
                ],
                "date": [
                    {
                        "label": "Date",
                        "content": "1980s"
                    }
                ],
                "identifier": [
                    {
                        "label": "Object number",
                        "content": "2012.36.4ab"
                    }
                ],
                "notes": [
                    {
                        "label": "Description",
                        "content": "A pair of wooden drumsticks, the last to be used by Art Blakey. The drumsticks are cylindrical with one rounded end and one tapered end with a small bulbous tip. Stamped labels in black read \"VIC / FIRTH\" and \"AMERICAN CLASSIC 5A / USA\". One of the sticks is scratched and gouged heavily, with material missing from the tip."
                    }
                ],
                "creditLine": [
                    {
                        "label": "Credit Line",
                        "content": "Collection of the Smithsonian National Museum of African American History and Culture, Gift of Peter Bradley"
                    }
                ],
                "name": [
                    {
                        "label": "Created by",
                        "content": "Vic Firth Company, American, founded 1963"
                    },
                    {
                        "label": "Used by",
                        "content": "Art Blakey, American, 1919 - 1990"
                    }
                ],
                "topic": [
                    {
                        "label": "Topic",
                        "content": "African American"
                    },
                    {
                        "label": "Topic",
                        "content": "Instrumentalists (Musicians)"
                    },
                    {
                        "label": "Topic",
                        "content": "Jazz (Music)"
                    }
                ],
                "place": [
                    {
                        "label": "Place made",
                        "content": "United States, North and Central America"
                    }
                ],
                "physicalDescription": [
                    {
                        "label": "Medium",
                        "content": "wood"
                    },
                    {
                        "label": "Dimensions",
                        "content": "2012.36.4a: 16 x 1/2 x 1/2 in. (40.6 x 1.3 x 1.3 cm)"
                    },
                    {
                        "label": "Dimensions",
                        "content": "2012.36.4b: 16 x 1/2 x 1/2 in. (40.6 x 1.3 x 1.3 cm)"
                    }
                ],
                "dataSource": [
                    {
                        "label": "Data Source",
                        "content": "National Museum of African American History and Culture"
                    }
                ],
                "objectRights": [
                    {
                        "label": "Restrictions & Rights",
                        "content": "No Known Copyright Restrictions"
                    }
                ],
                "objectType": [
                    {
                        "label": "Type",
                        "content": "drumsticks"
                    }
                ]
            }
        },
        "hash": "1e0c93ee9d6f94e6b53545b55eb85fa2e1792b1c",
        "docSignature": "1cead0bfa8926504e4af3d8741b8cca1de55084c_bcb823c6ce170fcf6e8677e5fee59b73",
        "timestamp": "1618820050",
        "lastTimeUpdated": "1618820050",
        "version": ""
    }
}
 */


/* category response*/

/*
 {
   "status": 200,
   "responseCode": 1,
   "response": {
     "rows": [
       {
         "id": "edanmdm-nmah_694280",
         "title": "Psychological Tests, Haines Group Alertness Tests",
         "unitCode": "NMAH",
         "type": "edanmdm",
         "url": "edanmdm:nmah_694280",
         "content": {
           "descriptiveNonRepeating": {
             "record_ID": "nmah_694280",
             "unit_code": "NMAH",
             "title_sort": "PSYCHOLOGICAL TESTS, HAINES GROUP ALERTNESS TESTS",
             "guid": "http://n2t.net/ark:/65665/ng49ca746b4-d5fc-704b-e053-15f76fa0b4fa",
             "title": {
               "label": "Title",
               "content": "Psychological Tests, Haines Group Alertness Tests"
             },
             "metadata_usage": {
               "access": "CC0"
             },
             "data_source": "National Museum of American History"
           },
           "indexedStructured": {
             "object_type": [
               "psychological test"
             ],
             "name": [
               "Haines, Thomas H.",
               "C. H. Stoelting Company"
             ],
             "topic": [
               "Psychology",
               "Psychological Tests",
               "Mathematics"
             ],
             "online_media_type": [
               "Images"
             ]
           },
           "freetext": {
             "setName": [
               {
                 "label": "See more items in",
                 "content": "Medicine and Science: Mathematics"
               }
             ],
             "identifier": [
               {
                 "label": "ID Number",
                 "content": "MA.316371.019"
               },
               {
                 "label": "catalog number",
                 "content": "316371.019"
               },
               {
                 "label": "accession number",
                 "content": "316371"
               }
             ],
             "notes": [
               {
                 "label": "Description",
                 "content": "The Haines Test has been assigned three subindex numbers. This folder contains the Haines Group Alertness Tests, Forms X and A: A Manual of Directions for Giving the Tests and for Scoring the Results of Tests, The Haines Alertness Test—Form X, and a cardboard sheet with Test 1 and Test 2 on the front and Tests 3, 4, and 5 on the back."
               },
               {
                 "label": "Description",
                 "content": "316371.19.01"
               },
               {
                 "label": "Description",
                 "content": "The Manual of Directions is twenty pages long. The group test (form X) aimed to measure “general intelligence of adult illiterates of school children in grades I to IV inclusive and in small rural schools.” The booklet provides a script for what the proctor should say. It also provides an opportunity to “practice” each of the different tests before the test itself is given. The different tests include a directions test; a scorekeeping test; a maze test; an unfinished pictures test; and an unfinished sentences test. The group test (form A) was an “adaptation of the Army Alpha Test for use in schools.” This included a directions test; an arithmetic test; a maze test; an antonym test; a disarranged sentence test; an analogy test; a practical judgment test; and a number series extension test."
               },
               {
                 "label": "Description",
                 "content": "316371.19.02"
               },
               {
                 "label": "Description",
                 "content": "The Haines’ Alertness Test—Form X is eight pages long. It was copyrighted in 1924 by C.H. Stoelting Co."
               },
               {
                 "label": "Description",
                 "content": "316371.19.03"
               },
               {
                 "label": "Description",
                 "content": "This cardboard sheet does not have a title. It is labeled Test 1 and Test 2 on the front and Tests 3, 4, and 5 on the back."
               },
               {
                 "label": "Location",
                 "content": "Currently not on view"
               }
             ],
             "creditLine": [
               {
                 "label": "Credit Line",
                 "content": "Gift of David Shakow"
               }
             ],
             "name": [
               {
                 "label": "maker",
                 "content": "Haines, Thomas H."
               },
               {
                 "label": "publisher",
                 "content": "C. H. Stoelting Company"
               }
             ],
             "topic": [
               {
                 "label": "subject",
                 "content": "Psychology"
               },
               {
                 "label": "subject",
                 "content": "Psychological Tests"
               },
               {
                 "label": "subject",
                 "content": "Mathematics"
               }
             ],
             "physicalDescription": [
               {
                 "label": "Physical Description",
                 "content": "paper (overall material)"
               },
               {
                 "label": "Measurements",
                 "content": "overall: 21.5 cm x 28.3 cm; 8 15/32 in x 11 5/32 in"
               }
             ],
             "dataSource": [
               {
                 "label": "Data Source",
                 "content": "National Museum of American History"
               }
             ],
             "objectType": [
               {
                 "label": "Object Name",
                 "content": "psychological test"
               }
             ]
           }
         },
         "hash": "9e7e9cb4c23fc6393ff4e3e351e67dc0cfb8a5c5",
         "docSignature": "41d94474866715885f91f5a4b994be82032c2cd2_b30da03702d36e566d64981a093165d6",
         "timestamp": "1618820702",
         "lastTimeUpdated": "1618820702",
         "version": ""
       },
 */

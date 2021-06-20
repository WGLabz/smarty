
# `Smarty` Design Specifications

## Technologies

1. ExpressJS.    (Nginx)
2. Database (MongoDB)
3. VueJS

## Database Details

### Tables: (MongoDB/Apache Solr/Couch Base)

1. Device Categories `name,description`
2. Device Details `Name, Price, Date Added, isActive, Category, Warranty, about, manufacturer_link, device_id`
3. Device Connectivity Details `device, protocol_details`
4. Warranty Details.
5. Available Purchase Links. `link, device_id, price`
6. Device App Availability Details.
7. Device Compatible/Integration Services Details.
8. Device Physical Details.
9. Device Power Details.
10. Device Features.
11. Analytics Data
12. Videos on Devices (YouTube/Video) `link,name`
  
### Device Categories

`Bulb` `Voice Assistants` `Plugs` `TV` `Refrigerator` `Water Purifier` `Washing Machine` `Air Purifier` `Music System` `Toaster` `Oven` `Extension boards` `Watch` `Hub` `Fan` `Retrofit Modules`

### Device Category Templates

1. Bulb

```JSON
{
    "power":"",
    "voltage":"",
    "color_type":"",
    "base_type":"",
    "luminosity":"",
    "material":"",
    "color_temperature":"",
    "part_number":"",
    "battery_powered":""
}
```

## Product Details:-

```JSON
{
    "status" :"OK",
    "meta":{
        "images":["","","",""],
        "name": "Philips Hue Bulb",
        "description": "A Smart Bulb",
        "category": "Smart Bulb",
        "product_link": "http://hdf.com",
        "video":{"source": "" ,"link":""},
        "price":[{"currency":"","value":45},{"currency":"","value":45},{"currency":"","value":45}]
    },
    "communication_details":
        [
            {
                "name":"Wi-Fi",
                "2.4GHz" : true,
                "5 GHz" : false,
                "message":""
            },
            {
                "name":"Wi-Fi",
                "version" : "V4",
                "BLE" : true,
                "message":""
            },
           {
                "message":"",
                "name":"z-wave"
            }
        ]
    ,
    "physical_dimensions":{
        "weight": "",
        "height" : "",
        "shape":"",
        "width":"",
        "length":""
    },
    "purchase_details":[{
        "name" : "Amazon",
        "price":"",
        "link":"",
        "rating":"",
    },
    {
        "name" : "Flipkart",
        "price":"",
        "link":"",
        "rating":"",
    },
    {
        "name" : "JiO",
        "price":"",
        "link":"",
        "rating":"",
    }

    ],
    "specs": {
        // As  per category template
    },
    "app_or_hub_compatibility":[
        {"name":"Google Home", "link":"", "download_link":"", "pricing":""},
        {"name":"Google Home", "link":"", "download_link":"", "pricing":""},
        {"name":"Google Home", "link":"", "download_link":"", "pricing":""},
    ],
    "applications":[
        {"os":"Android","link":"","pricing":"","rating":""},
        {"os":"iOS","link":"","pricing":"","rating":""},
        {"os":"Windows","link":"","pricing":"","rating":""},
    ],
    "automation_hubs":[
            {"os":"Android","link":"","pricing":"","rating":""}
    ],
    "custom_firmware":[
        {"name": "TASMOTA"}
    ]
}

```

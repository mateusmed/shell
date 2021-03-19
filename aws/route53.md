
Change ip from command line

```
aws route53 change-resource-record-sets --hosted-zone-id <ZONE_ID> 
                                        --change-batch                        
                '{"Changes":[
                            {"Action":"UPSERT",
                             "ResourceRecordSet":{"Name":<NAME>,
                                                  "Type":"A",
                                                  "TTL":300,
                                                  "ResourceRecords":[{"Value":"<IP_SERVER>"}]}}
                             ]}'
```
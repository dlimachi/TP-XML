<osm_result xmlns:xsi = "http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="intermediate.xsd">
{
for $name in doc("o2.xml")//node/tag[@k = 'education' or @k = 'amenity' or @k = 'tourism' or @k = 'health' or @k = 'transport' or @k = 'historic' or @k = 'shops' or @k = 'buildings']
  where string-length($name/../tag[@k = 'name']/@v/string()) >= 1
    return
      <node lat="{$name/../@lat}" lon="{$name/../@lon}">&#xA;
        <name>{$name/../tag[@k = 'name']/@v/string()}</name>&#xA;
        <category>&#xA;
          <type>{$name/@k/string()}</type>&#xA;
          <subtype>{$name/@v/string()}</subtype>&#xA;
        </category>&#xA;
        <location>&#xA;
          <city>{$name/../tag[@k = 'addr:city']/@v/string()}</city>&#xA;
          <postcode>{$name/../tag[@k = 'addr:postcode']/@v/string()}</postcode>&#xA;
          <street>{$name/../tag[@k = 'addr:street']/@v/string()}</street>&#xA;
        </location>&#xA;
        <phone>{$name/../tag[@k = 'phone']/@v/string()}</phone>&#xA;
        <website>{$name/../tag[@k = 'website']/@v/string()}</website>&#xA;
        <email>{$name/../tag[@k = 'email']/@v/string()}</email>&#xA;
      </node>
}
</osm_result>

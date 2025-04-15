import xml.etree.ElementTree as ET

#This is a simple script that parses through the xml file

# Load the XML file

tree = ET.parse('cve_list.xml')
root = tree.getroot()


# Iterates over each VCE entry in the XML

for cve in root.findall('cve'):
    cve_od = cve.get('id')
    name = cve.find('name').text
    severity = cve.find('severity').text
    description = cve.find('description').text
    publish_date = cve.find('publish_date').text


# Prints the CVE details

    
    print(f'CVE ID: {id}')
    print(f'Name: {name}')
    print(f'Severity: {severity}')
    print(f'Description: {description}')
    print(f'Publish Date: {publish_date}')
    print('-' * 40)

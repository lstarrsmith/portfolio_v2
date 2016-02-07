# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Admin.delete_all
Project.delete_all
Image.delete_all
Category.delete_all

#admin
logan = Admin.create({fname: "Logan", lname: "Smith", email: "logan29smith@gmail.com", password: "logan"})

#Project
dashboard = Project.create({rank: 1, name: "Dashboard", has_subsection: true})
eims = Project.create({rank: 2, name: "eIMS", has_subsection: true})
handle_it = Project.create({rank: 3, name: "Handle It", has_subsection: true})
bridge = Project.create({rank: 4, name: "Bridge", has_subsection: true})
project_al = Project.create({rank: 5, name: "Project Al", has_subsection: true})
our_recovery = Project.create({rank: 6, name: "Our Recovery", has_subsection: true})
swat_app = Project.create({rank: 7, name: "SWAT App", has_subsection: true})
diabetes_app = Project.create({rank: 8, name: "Diabetes App", has_subsection: true})
cmp= Project.create({rank: 9, name: "CMP", has_subsection: false})
eid = Project.create({rank: 10, name: "EID", has_subsection: false})
koi = Project.create({rank: 11, name: "KOI", has_subsection: false})
human_connect = Project.create({rank: 12, name: "Human Connect", has_subsection: false})
digital_health_product_hunt = Project.create({rank: 13, name: "Digital Health Product Hunt", has_subsection: false})
contact_app = Project.create({rank: 14, name: "Contact App", has_subsection: false})

#Category

problem = Category.create({project_id: 1, name: "Problem", project_text: "Health data isn’t accessible to all players -- government officials, donors, implementing partners -- in the global health space."})
context = Category.create({project_id: 1, name: "Context", project_text: "DHIS2 stores health data in most countries, but it’s (justifiably) only accessible by a select few organizations. In Uganda, an government agency makes it difficult to access this data without a lengthy approval process."})
product = Category.create({project_id: 1, name: "Product", project_text: "A template and open source dashboard front end which displays key metrics for different programs."})
implementation = Category.create({project_id: 1, name: "Implementation", project_text: "We launched with Uganda’s Central Public Health Laboratory (CPHL) for their HIV testing programs (Early Infant Diagnosis and Viral Load). Then we expanded to pulling approved, aggregate data from DHIS2 for malaria and vaccines data."})
design_process = Category.create({project_id: 1, name: "Design Process", project_text: "I first sat with my public health gurus / coworkers at the Clinton Health Access Initiative and asked (ish) the following quetions:

- Who do you think the key users are?
- What data will be the most actionable for them on a daily/ weekly/ monthly basis?
- Do we have approval to display __ data? 
- Are there any tradeoffs to showing data at a granular level? (for example, down to the health facility level)
- How do you think the key users most like to consume this data? 
- What are the most annoying parts about the way the data is disseminated and displayed now? 

I then had the same conversation with other teams and started to see some similarities. Amongst them:

- Each team had 3-4 key indicators they like to display
- Most teams want to filter by date and location, and also have 1-2 other important filters
- Trends (ex. to indicate seasonality) are important
- There are other statistics which are less actionable but need to be seen in aggregate on a regular basis

So I started sketching and prototyping some initial versions. "})
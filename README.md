# README

## Repo to accompany a blog post on Scenic


### An example of a User with multiple organizations and events

```
irb(main):003:0> pp User.find(120).organizations
  User Load (0.3ms)  SELECT  "users".* FROM "users" WHERE "users"."id" = $1 LIMIT $2  [["id", 120], ["LIMIT", 1]]
  Organization Load (0.9ms)  SELECT "organizations".* FROM "organizations" INNER JOIN "memberships" ON "organizations"."id" = "memberships"."organization_id" WHERE "memberships"."user_id" = $1  [["user_id", 120]]
[#<Organization:0x00007fcddfb262e0
  id: 13,
  name: "Make Food not Bombs",
  created_at: Mon, 06 May 2019 02:09:03 UTC +00:00,
  updated_at: Mon, 06 May 2019 02:09:03 UTC +00:00>,
 #<Organization:0x00007fcddfb26128
  id: 14,
  name: "Coaches for Canada",
  created_at: Mon, 06 May 2019 02:09:03 UTC +00:00,
  updated_at: Mon, 06 May 2019 02:09:03 UTC +00:00>]
=> #<ActiveRecord::Associations::CollectionProxy [#<Organization id: 13, name: "Make Food not Bombs", created_at: "2019-05-06 02:09:03", updated_at: "2019-05-06 02:09:03">, #<Organization id: 14, name: "Coaches for Canada", created_at: "2019-05-06 02:09:03", updated_at: "2019-05-06 02:09:03">]>
irb(main):004:0> pp User.find(120).events
  User Load (0.5ms)  SELECT  "users".* FROM "users" WHERE "users"."id" = $1 LIMIT $2  [["id", 120], ["LIMIT", 1]]
  Event Load (1.0ms)  SELECT "events".* FROM "events" INNER JOIN "participations" ON "events"."id" = "participations"."event_id" WHERE "participations"."user_id" = $1  [["user_id", 120]]
[#<Event:0x00007fcde0bf15e8
  id: 31,
  name: "Baby Got Track 2019",
  organization_id: 13,
  created_at: Mon, 06 May 2019 02:09:03 UTC +00:00,
  updated_at: Mon, 06 May 2019 02:09:03 UTC +00:00>,
 #<Event:0x00007fcde0bf1458
  id: 33,
  name: "Santa's toy drive",
  organization_id: 14,
  created_at: Mon, 06 May 2019 02:09:03 UTC +00:00,
  updated_at: Mon, 06 May 2019 02:09:03 UTC +00:00>,
 #<Event:0x00007fcde0bf12c8
  id: 35,
  name: "Everyday is Earth Day",
  organization_id: 14,
  created_at: Mon, 06 May 2019 02:09:03 UTC +00:00,
  updated_at: Mon, 06 May 2019 02:09:03 UTC +00:00>]
```

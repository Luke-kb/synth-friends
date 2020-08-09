User.create!([
  {email: "bob@test.com", encrypted_password: "$2a$12$1X8Blpum1Norgx7v2HVXJOIfsLm2XnXCyfL1YKIQuopkoLrHM/AJS", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, admin: false},
  {email: "jane@test.com", encrypted_password: "$2a$12$5N5hM7I2OEirstym9ggSFulWuJPLPapqcPxTSfN1HgNFDAMjnT2jG", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, admin: false},
  {email: "admin@test.com", encrypted_password: "$2a$12$KmGWDGpm3B4CH4LGKNDG7ucM1k24c3SsH5kbvcGqIR4c1zLPq0eFa", reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, admin: true}
])
Category.create!([
  {name: "Keyboard Synth"},
  {name: "Desktop Synth"},
  {name: "Effects"},
  {name: "Midi"},
  {name: "Modular"},
  {name: "Accessories"}
])
Profile.create!([
  {first_name: "Admin", last_name: "Admin", location: "2000", user_id: 3, bio: "bio"},
  {first_name: "Jane", last_name: "Medhurst", location: "4200", user_id: 2, bio: "bio"},
  {first_name: "Bob", last_name: "Baumbach", location: "2120", user_id: 1, bio: "bio"}
])
Brand.create!([
  {name: "Arturia"},
  {name: "Moog"},
  {name: "Korg"},
  {name: "Elektron"},
  {name: "Dave Smith Instruments"},
  {name: "Yamaha"},
  {name: "Access"},
  {name: "Waldorf"}
])
Listing.create!([
  {title: "MatrixBrute", description: "analog monosynth with digital control", price: "25.0", year_of_manufacture: 2016, lender_id: 2, renter_id: nil, profile_id: nil, availability: true, brand_id: 1, category_id: 1},
  {title: "Minimoog Voyager XL", description: "famed analog monosynth", price: "35.0", year_of_manufacture: 2010, lender_id: 1, renter_id: nil, profile_id: nil, availability: true, brand_id: 2, category_id: 1}
])
ActiveStorage::Attachment.create!([
  {name: "image", record_type: "Listing", record_id: 1, blob_id: 1},
  {name: "image", record_type: "Listing", record_id: 2, blob_id: 3},
  {name: "image", record_type: "Profile", record_id: 3, blob_id: 4},
  {name: "image", record_type: "Profile", record_id: 2, blob_id: 5},
  {name: "image", record_type: "Profile", record_id: 1, blob_id: 6}
])
ActiveStorage::Blob.create!([
  {key: "ib792obp5kb7bp67p75ptpvv2re6", filename: "matrix-brute.jpg", content_type: "image/jpeg", metadata: {"identified"=>true, "analyzed"=>true}, byte_size: 101845, checksum: "VmT0jRFIsT+TeAcwSapNTw=="},
  {key: "tg97in4q0zc9z4sjuyq6crczvpqr", filename: "MoogMinimoogVoyagerXL.jpg", content_type: "image/jpeg", metadata: {"identified"=>true, "analyzed"=>true}, byte_size: 254801, checksum: "EQGIPMKC3oerft2rgBfhFg=="},
  {key: "04trbbffx23wdxx66fchqet9banc", filename: "blank.png", content_type: "image/png", metadata: {"identified"=>true, "analyzed"=>true}, byte_size: 10663, checksum: "H5X6VJTQB/KpVYTqIzI6Ew=="},
  {key: "bisyq1h9itqig36xd3kalci7uyyu", filename: "dog.jpeg", content_type: "image/jpeg", metadata: {"identified"=>true, "analyzed"=>true}, byte_size: 190251, checksum: "vkj0x/3tT0JdSKBlXfZhBQ=="},
  {key: "yhpztv8v0g3pvxituxqamj2twkef", filename: "Bob_the_builder.jpg", content_type: "image/jpeg", metadata: {"identified"=>true, "analyzed"=>true}, byte_size: 16413, checksum: "I6cpT+26QkfO2Tm1yBlCgg=="}
])

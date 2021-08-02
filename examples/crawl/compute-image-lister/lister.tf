// Copyright (c) 2021, Oracle and/or its affiliates. All rights reserved.
// Licensed under the Universal Permissive License v 1.0 as shown at https://oss.oracle.com/licenses/upl.

locals {
  images = { for i in data.oci_core_images.existing.images :
    i.id => { "os" : i.operating_system, "os_version" : i.operating_system_version, "name" : i.display_name }
  }
  shapes = [for i in data.oci_core_image_shapes.existing :
    { for j in i.image_shape_compatibilities :
      j.image_id => j.shape...
    }
  ]
  images_and_shapes = [for k in local.shapes :
    { for i, j in k :
      local.images[i].name => { "os" : local.images[i].os, "os_version" : local.images[i].os_version, "id" : i, "shapes" : j }
    }
  ]
}

data "oci_core_images" "existing" {
  compartment_id           = ""
  operating_system         = ""
  operating_system_version = ""
}

data "oci_core_image_shapes" "existing" {
  for_each = local.images
  image_id = each.key
}

output "images" {
  value = local.images_and_shapes
}

# Supported values: 
# Operating System: 'Canonical Ubuntu', 'Oracle Linux', 'CentOS', 'Windows'

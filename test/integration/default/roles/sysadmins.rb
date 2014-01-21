name        "sysadmins"
description "Create some sysadmins and configure sudo"

default_attributes(
  'authorization' => {
    'sudo' => {
      'users' => ['vagrant'],
      'passwordless' => true,
      'include_sudoers_d' => true
    }
  }
)

run_list "recipe[sudo]",
         "recipe[users::sysadmins]"

class people::pfenig {
  include osx::finder::show_all_on_desktop
  include osx::finder::unhide_library
  include osx::finder::show_hidden_files
  
  include chrome
  include hipchat
  include iterm2::dev
  include iterm2::colors::solarized_light
  include iterm2::colors::solarized_dark
  include vim
  include tmux
  include keyremap4macbook
  include tunnelblick
  include pckeyboardhack
  include zsh
  include gitx::dev
  
  package {
    [
      'qt'
    ]:
  }
  
  repository {'robbyrussell_oh-my-zsh':
    source => 'robbyrussell/oh-my-zsh',
    path   => "/Users/${::luser}/.oh-my-zsh",
  }

  boxen::project { 'gc':
    ruby   => '1.9.3',
    mysql  => true,
    redis  => true,
    source => 'NavigatingCancer/gc'
  }

  boxen::project { 'crimson':
    ruby   => '1.9.3',
    redis  => true,
    source => 'NavigatingCancer/crimson'
  }

  boxen::project { 'fuchsia':
    ruby   => '1.9.3',
    redis  => true,
    source => 'NavigatingCancer/fuchsia'
  }
}

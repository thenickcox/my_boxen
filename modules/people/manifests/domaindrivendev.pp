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
  #include keyremap4macbook
  include tunnelblick
  #include pckeyboardhack
  #include zsh
  include gitx::dev
  include sequel_pro
  
  package {
    [
      'reattach-to-user-namespace',
    ]:
  }
  
  #repository {'robbyrussell_oh-my-zsh':
    #source => 'robbyrussell/oh-my-zsh',
    #path   => "/Users/${::luser}/.oh-my-zsh",
  #}

  repository {'${boxen::config::srcdir}/dotfiles':
    ensure => present,
    source => 'domaindrivendev/.dotfiles',
    path   => "${boxen::config::srcdir}/dotfiles",
  }

  #file { "/Users/${::luser}/.tmux.conf":
    #ensure  => link,
    #mode    => '0644',
    #target  => "${boxen::config::srcdir}/dotfiles/.tmux.conf",
    #require => Repository["${boxen::config::srcdir}/dotfiles"],
  #}

  file { "/Users/${::luser}/.zshrc":
    ensure  => link,
    mode    => '0644',
    target  => "${boxen::config::srcdir}/dotfiles/.zshrc",
    require => Repository["${boxen::config::srcdir}/dotfiles"],
  }

  file { "/Users/${::luser}/.ackrc":
    ensure  => link,
    mode    => '0644',
    target  => "${boxen::config::srcdir}/dotfiles/.ackrc",
    require => Repository["${boxen::config::srcdir}/dotfiles"],
  }

  file { "/Users/${::luser}/.vimrc":
    ensure => link,
    mode   => '0644',
    target => "${boxen::config::srcdir}/dotfiles/.vimrc",
    require => Repository["${boxen::config::srcdir}/dotfiles"],
  }

  boxen::project { 'gc':
    ruby   => '1.9.3-p385',
    mysql  => true,
    redis  => true,
    source => 'NavigatingCancer/gc'
  }

  boxen::project { 'crimson':
    ruby   => '1.9.3-p392',
    redis  => true,
    source => 'NavigatingCancer/crimson'
  }

  boxen::project { 'fuchsia':
    redis  => true,
    source => 'NavigatingCancer/fuchsia'
  }

  #git::config::local { 'gc_email_config':
    #repo => "${boxen::config::srcdir}/gc",
    #key => "user.email",
    #value => "steve@navigatingcancer.com"
  #}

  #git::config::local { 'gc_name_config':
    #repo => "${boxen::config::srcdir}/gc",
    #key => "user.name",
    #value => "Steven Fenigstein"
  #}

  git::config::global { 'user.email':
    value  => 'steven.fenigstein@gmail.com'
  } 
  git::config::global { 'user.name':
    value  => 'pfenig'
  } 
}

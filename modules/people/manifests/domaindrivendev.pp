class people::domaindrivendev {
  include osx::finder::show_all_on_desktop
  include osx::finder::unhide_library
  include osx::finder::show_hidden_files
  
  include chrome
  include hipchat
  include iterm2::dev
  include iterm2::colors::solarized_light
  include iterm2::colors::solarized_dark
  include tmux
  include keyremap4macbook
  include tunnelblick
  include pckeyboardhack
  include zsh
  include gitx::dev
  include sequel_pro
	include ctags
  include java
  include rabbitmq
  include mosh
  include openoffice

  package {
    [
			'qt',
      'freetds',
#      'bash',
#      'reattach-to-user-namespace',
#      'xpdf'
    ]:
  }
  
  repository {'${boxen::config::srcdir}/dotfiles':
    ensure => present,
    source => 'domaindrivendev/dotfiles',
    path   => "${boxen::config::srcdir}/dotfiles",
  }

  file { "/Users/${::luser}/.zshrc":
    ensure  => link,
    mode    => '0644',
    target  => "${boxen::config::srcdir}/dotfiles/.zshrc",
    require => Repository["${boxen::config::srcdir}/dotfiles"],
  }

  repository {'robbyrussell_oh-my-zsh':
    source => 'robbyrussell/oh-my-zsh',
    path   => "${boxen::config::srcdir}/oh-my-zsh",
  }

  file { "/Users/${::luser}/.tmux.conf":
    ensure  => link,
    mode    => '0644',
    target  => "${boxen::config::srcdir}/dotfiles/.tmux.conf",
    require => Repository["${boxen::config::srcdir}/dotfiles"],
  }

  file { "/Users/${::luser}/.gitconfig":
    ensure => link,
    mode   => '0644',
    target => "${boxen::config::srcdir}/dotfiles/.gitconfig",
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

  file { "/Users/${::luser}/.vim":
		force => true,
    ensure => link,
    mode   => '0644',
    target => "${boxen::config::srcdir}/dotfiles/.vim",
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
}

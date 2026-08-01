# @api private
class slurm::common::install::apt {
  Package {
    ensure  => $slurm::package_ensure,
    notify  => $slurm::service_notify,
  }

  if $slurm::slurmd or $slurm::slurmctld or $slurm::client {
    package { $slurm::base_install_packages: }
  }

  if $slurm::slurmd {
    package { $slurm::slurmd_install_packages: }
  }

  if $slurm::slurmctld {
    package { $slurm::slurmctld_install_packages: }
  }

  if $slurm::slurmdbd {
    package { $slurm::slurmdbd_install_packages: }
  }

  if $slurm::install_pam { package { $slurm::pam_install_packages: } }
  if $slurm::install_torque_wrapper { package { $slurm::torque_install_packages: } }
}

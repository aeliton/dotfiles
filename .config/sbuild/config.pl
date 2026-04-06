$chroot_mode = 'unshare';
$external_commands = { "build-failed-commands" => [ [ '%SBUILD_SHELL' ] ] };
$build_arch_all = 1;
$build_source = 1;
$source_only_changes = 1;
$run_lintian = 1;
$lintian_opts = ['--display-info', '--verbose', '--fail-on', 'error,warning', '--info'];
$run_autopkgtest = 1;

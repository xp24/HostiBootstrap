module.exports = function(grunt) {
	grunt.initConfig({
		pkg: grunt.file.readJSON('package.json'),

		bower: {
			install: {
				options: {
					targetDir: './frontend/_public/vendors',
					verbose: true,
					install: true,
					cleanup: true
				}
			}
		}
	});

	grunt.loadNpmTasks('grunt-bower-task');

	grunt.registerTask('default', [ 'bower' ]);
};
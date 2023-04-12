Pod::Spec.new do |spec|
  spec.name         = 'GDoge'
  spec.version      = '{{.Version}}'
  spec.license      = { :type => 'GNU Lesser General Public License, Version 3.0' }
  spec.homepage     = 'https://github.com/dogeum-network-network/go-dogeum'
  spec.authors      = { {{range .Contributors}}
		'{{.Name}}' => '{{.Email}}',{{end}}
	}
  spec.summary      = 'iOS Dogeum Client'
  spec.source       = { :git => 'https://github.com/dogeum-network-network/go-dogeum.git', :commit => '{{.Commit}}' }

	spec.platform = :ios
  spec.ios.deployment_target  = '9.0'
	spec.ios.vendored_frameworks = 'Frameworks/GDoge.framework'

	spec.prepare_command = <<-CMD
    curl https://gdogestore.blob.core.windows.net/builds/{{.Archive}}.tar.gz | tar -xvz
    mkdir Frameworks
    mv {{.Archive}}/GDoge.framework Frameworks
    rm -rf {{.Archive}}
  CMD
end

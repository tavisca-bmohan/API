pipeline 
{ 
	agent any 
	
	parameters 
	{
        	string(name: 'GIT_HTTPS_PATH', defaultValue: 'https://github.com/tavisca-bmohan/API.git')
		string(name: 'NUGET_PACKAGE', defaultValue: 'https://api.nuget.org/v3/index.json')
        	string(name: 'API_SOLUTION', defaultValue: 'API.sln')
		string(name: 'TEST_PROJECT_PATH', defaultValue: 'UnitTestsForAPI/UnitTestsForAPI.csproj')
		string(name: 'PATH_TO_ARTIFACT', defaultValue: 'API/bin/Release/netcoreapp2.2/publish/*')
		string(name: 'PATH_TO_UNZIP_ARTIFACT', defaultValue: 'C:/Users/bmohan/Desktop/unzip')
        	choice(name:'choices',choices: ['Both','Build', 'Test'])
		string(name: 'PROJECT_NAME', defaultValue: 'API')
	}
	
	stages 
	{ 
		
		stage('restore')
		{
            		steps
			{
                    		powershell '''
				dotnet restore ${API_SOLUTION} --source https://api.nuget.org/v3/index.json
				'''
            		}
        	}
		
		stage('Build') 
		{ 
			steps 
			{ 
				powershell '''
		 		dotnet build ${API_SOLUTION} -p:Configration=release -v:n
				'''
			} 
		} 

		stage('Test') 
		{ 
			steps 
			{ 
				powershell '''dotnet test ${TEST_PROJECT_PATH}'''
			} 
		}

		stage('Publish') 
		{ 
			steps 
			{ 
				bat '''
				dotnet publish -c Release -o ../publish
				docker build --tag=dockerimage .
				'''
				
			} 
		} 
		
		/*stage('Compress') 
		{
            		steps 
			{
				powershell '''compress-archive ${PATH_TO_ARTIFACT} artifactFiles.zip -Update'''
            		}
        	}
       
        	stage('Deploy') 
		{
            		steps 
			{
				powershell '''expand-archive artifactFiles.zip ${PATH_TO_UNZIP_ARTIFACT} -Force'''
            		}
        	}*/
		
		stage('Deploy') 
		{
            		steps 
			{
				powershell '''docker run -p 5000:80 dockerimage '''
            		}
        	}
	} 
	
}

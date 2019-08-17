pipeline 
{ 
	agent any 
	
	parameters 
	{
        	string(name: 'GIT_HTTPS_PATH', defaultValue: 'https://github.com/tavisca-bmohan/API.git')
        	string(name: 'TEST_PROJECT_PATH', defaultValue: 'UnitTestsForAPI/UnitTestsForAPI.csproj')
        	string(name: 'API_SOLUTION', defaultValue: 'API.sln')
        	choice(name:'choices',choices: ['Both','Build', 'Test'])
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
				powershell '''dotnet publish -c Release'''
			} 
		} 
		
		stage('Compress') 
		{
            		steps 
			{
                		powershell '''compress-archive API\\bin\\Release\\netcoreapp2.2\\publish\\* artifactFiles.zip -Update'''
            		}
        	}
       
        	stage('Deploy') 
		{
            		steps 
			{
                		powershell '''expand-archive artifactFiles.zip C:\\Users\\bmohan\\Desktop\\unzip -Force'''
            		}
        	}	
	} 
	
}

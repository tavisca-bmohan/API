pipeline 
{ 
	agent any 
	
	parameters 
	{
        	string(name: 'GIT_HTTPS_PATH', defaultValue: 'https://github.com/tavisca-bmohan/API.git')
		string(name: 'API_SOLUTION', defaultValue: 'API.sln')
		string(name: 'TEST_PROJECT_PATH', defaultValue: 'UnitTestsForAPI/UnitTestsForAPI.csproj')
		
		/*
		string(name: 'PROJECT_NAME', defaultValue: 'API')
		string(name: 'PATH_TO_ARTIFACT', defaultValue: 'API/bin/Release/netcoreapp2.2/publish/*')
		string(name: 'PATH_TO_UNZIP_ARTIFACT', defaultValue: 'C:/Users/bmohan/Desktop/unzip')
		choice(name:'choices',choices: ['Both','Build', 'Test'])
		*/
	}
	
	stages 
	{ 
		
		stage('Build') 
		{ 
			steps 
			{ 
				bat '''
				echo --------------Build Started------------------------
				dotnet C:\sonar\SonarScanner.MSBuild.dll begin /k:"api" /d:sonar.host.url="http://localhost:9000" /d:sonar.login="ab12ede3c9b0cf6ba28158452937ba65ba1f271a"
				dotnet restore ${API_SOLUTION} --source https://api.nuget.org/v3/index.json
				docker build --tag=dockerimage .
				echo --------------Build Complete------------------------
				
				echo --------------Test Started------------------------
				dotnet test ${TEST_PROJECT_PATH}
				dotnet C:\sonar\SonarScanner.MSBuild.dll end /d:sonar.login="ab12ede3c9b0cf6ba28158452937ba65ba1f271a"
				echo --------------Test Complete------------------------
				
				echo --------------Publish Started------------------------
				docker login -u brijmohan123 -p Password@123
				docker push tag dockerimage brijmohan123/api
				docker push brijmohan123/api
				echo --------------Publish Complete------------------------
				'''
			} 
		}

		
		stage('Deploy') 
		{
            		steps 
			{
				bat '''
				echo --------------Deploy Started------------------------
				docker run -p 5000:80 dockerimage 
				'''
            		}
        	}
		
		/*-----------------------------------Comment---------------------------------------------------
		stage('Docker Image Publish') 
		{ 
			steps 
			{ 
				bat '''
				docker login -u brijmohan123 -p Password@123
				docker push tag dockerimage brijmohan123/api
				docker push brijmohan123/api
				'''
				
			} 
		}
		
		stage('Dotnet Build') 
		{ 
			steps 
			{ 
				powershell '''
				dotnet restore ${API_SOLUTION} --source https://api.nuget.org/v3/index.json
		 		dotnet build ${API_SOLUTION} -p:Configration=release -v:n
				'''
			} 
		} 
		
		stage('Dotnet Test') 
		{ 
			steps 
			{ 
				powershell '''dotnet test ${TEST_PROJECT_PATH}'''
			} 
		}
		
		stage('Compress') 
		{
            		steps 
			{
				powershell '''compress-archive ${PATH_TO_ARTIFACT} artifactFiles.zip -Update'''
            		}
        	}
       
        	stage('Unzip') 
		{
            		steps 
			{
				powershell '''expand-archive artifactFiles.zip ${PATH_TO_UNZIP_ARTIFACT} -Force'''
            		}
        	}
		-----------------------------------------------------------------------------------------------------
		*/
	} 
	
}

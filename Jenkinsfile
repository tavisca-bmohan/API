pipeline 
{ 
	agent any 
	stages 
	{ 
		
		stage('Build') 
		{ 
			steps 
			{ 
		 		powwershell(script: 'dotnet build API.sln -p:Configration=release -v:n')	
			} 
		} 

		stage('Test') 
		{ 
			steps 
			{ 
				powwershell(script: 'dotnet test')
			} 
		}

		stage('Publish') 
		{ 
			steps 
			{ 
				powwershell(script: 'dotnet publish -c Release')
			} 
		} 
		
		stage('Compress') 
		{
            		steps 
			{
                		powwershell(script: 'compress-archive API\\bin\\Release\\netcoreapp2.2\\publish\\* artifactFiles.zip -Update')
            		}
        	}
       
        	stage('Deploy') 
		{
            		steps 
			{
                		powwershell(script: 'expand-archive artifactFiles.zip C:\\Users\\bmohan\\Desktop\\unzip -Force')
            		}
        	}	
	} 
	
}

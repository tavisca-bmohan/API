pipeline 
{ 
	agent any 
	stages 
	{ 
		stage('Build') 
		{ 
			steps 
			{ 
		 
				sh 'dotnet build API.sln -p:Configration=release -v:n' 
					
			} 
		} 

		stage('Test') 
		{ 
			steps 
			{ 
				
				sh 'dotnet test'
				
			} 
		}

		stage('Publish') 
		{ 
			steps 
			{ 

				sh 'dotnet publish'
				
			} 
		} 

		
	} 
	
	post
    {
        always{
         archiveArtifacts '**'
            sh 'dotnet API/bin/Debug/netcoreapp2.2/API.dll'
            
        }
}
